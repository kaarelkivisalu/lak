#!/usr/bin/env python3
"""Visual diff for a single Typst file, combining `typdiff` (prose, word-level)
with `btdiff.py` (row-level diff for `#bt(...)` bid tables, which `typdiff`
otherwise treats as a single opaque block — see btdiff.py's module docstring).

Strategy: replace every `#bt(...)` block in both OLD and NEW with a one-line
placeholder keyed by a hash of its body, run `typdiff` on the placeholder'd
files (so its own block-matching handles whole-table inserts/deletes/moves
for us), then substitute the placeholders back in its output — with the
literal original block for untouched tables, or a `btdiff`-rendered
row-level diff for changed ones.

Usage (run from lak-typst/, or point paths at it from elsewhere):
    uv run --project tools tools/typst_pr_diff.py OLD.typ NEW.typ -o OUT.typ
    uv run --project tools tools/typst_pr_diff.py --neutralize-only NEW.typ -o OUT.typ
"""

import argparse
import difflib
import hashlib
import re
import subprocess
import sys

import btdiff
import btfmt

OPEN_RE = btfmt.OPEN_RE
CLOSE_RE = btfmt.CLOSE_RE


def extract_bt_blocks(text):
    """Find every `#bt(``` … ```)` block. Returns a list of dicts with the
    0-indexed [start, end] line range (inclusive, end = closing ```) line),
    the leading indent of `#bt(```, and the raw body text."""
    lines = text.split("\n")
    blocks = []
    i, n = 0, len(lines)
    while i < n:
        m = OPEN_RE.match(lines[i])
        if m:
            start = i
            j = i + 1
            body = []
            while j < n and not CLOSE_RE.match(lines[j]):
                body.append(lines[j])
                j += 1
            blocks.append({"start": start, "end": j, "indent": m.group(1), "body": "\n".join(body)})
            i = j + 1
        else:
            i += 1
    return blocks


def content_hash(body):
    return hashlib.sha1(body.encode("utf-8")).hexdigest()[:12]


def block_signature(body):
    """A coarse identity for a whole block, used only to pair up blocks whose
    content differs (matched tables to row-diff, vs. genuine inserts/deletes)."""
    for line in body.split("\n"):
        if line.strip():
            r = btfmt.parse_row(line)
            return r.text if r.kind == "hdr" else r.bid
    return ""


def placeholder_line(indent, token):
    return f"{indent}#{token}"


def build_placeholder_text(text, blocks, token_for):
    lines = text.split("\n")
    out = []
    last = 0
    for b in blocks:
        out.extend(lines[last:b["start"]])
        out.append(placeholder_line(b["indent"], token_for(b)))
        last = b["end"] + 1
    out.extend(lines[last:])
    return "\n".join(out)


def pair_changed_blocks(old_blocks, new_blocks, old_hash, new_hash, common_hashes):
    """Among blocks whose hash has no match on the other side, pair up likely
    modifications (same signature) vs. pure inserts/deletes."""
    old_remaining = [b for b in old_blocks if old_hash[id(b)] not in common_hashes]
    new_remaining = [b for b in new_blocks if new_hash[id(b)] not in common_hashes]

    old_sigs = [block_signature(b["body"]) for b in old_remaining]
    new_sigs = [block_signature(b["body"]) for b in new_remaining]
    sm = difflib.SequenceMatcher(None, old_sigs, new_sigs, autojunk=False)

    pairs, added, deleted = [], [], []
    for tag, i1, i2, j1, j2 in sm.get_opcodes():
        if tag == "equal":
            for oi, nj in zip(range(i1, i2), range(j1, j2)):
                pairs.append((old_remaining[oi], new_remaining[nj]))
        elif tag == "replace":
            span_old = old_remaining[i1:i2]
            span_new = new_remaining[j1:j2]
            for o, n in zip(span_old, span_new):
                pairs.append((o, n))
            deleted.extend(span_old[len(span_new):])
            added.extend(span_new[len(span_old):])
        elif tag == "delete":
            deleted.extend(old_remaining[i1:i2])
        elif tag == "insert":
            added.extend(new_remaining[j1:j2])
    return pairs, added, deleted


HEADING_RE = re.compile(r"^(=+)\s")


class _Section:
    def __init__(self, heading_line=None, level=0):
        self.heading_line = heading_line
        self.level = level
        self.body = []
        self.children = []


def _has_change(lines):
    """Fence-aware: a `+ `/`- ` prefix only counts inside a `#bt(...)` block
    (Typst's own list-item syntax is also `- text`/`+ text` outside of one)."""
    in_bt = False
    for line in lines:
        if OPEN_RE.match(line):
            in_bt = True
            continue
        if CLOSE_RE.match(line):
            in_bt = False
            continue
        if in_bt:
            if re.match(r"^\s*[+-] ", line):
                return True
        else:
            if "#diff-added[" in line or "#diff-deleted[" in line:
                return True
            if line.strip().startswith("//"):
                return True
    return False


def _parse_sections(text):
    root = _Section()
    stack = [root]
    in_bt = False
    for line in text.split("\n"):
        if OPEN_RE.match(line):
            in_bt = True
            stack[-1].body.append(line)
            continue
        if CLOSE_RE.match(line):
            in_bt = False
            stack[-1].body.append(line)
            continue
        m = None if in_bt else HEADING_RE.match(line)
        if m:
            level = len(m.group(1))
            while stack[-1].level >= level:
                stack.pop()
            sec = _Section(heading_line=line, level=level)
            stack[-1].children.append(sec)
            stack.append(sec)
        else:
            stack[-1].body.append(line)
    return root


def _section_changed(sec):
    if _has_change(sec.body):
        return True
    if sec.heading_line is not None and _has_change([sec.heading_line]):
        return True
    return any(_section_changed(c) for c in sec.children)


def _render_section(sec, keep_body):
    out = []
    if sec.heading_line is not None:
        out.append(sec.heading_line)
    if keep_body or _has_change(sec.body):
        out.extend(sec.body)
    for c in sec.children:
        if _section_changed(c):
            out.extend(_render_section(c, keep_body=False))
    return out


def prune_unchanged_sections(text):
    """Drop `==`/`===`/... heading sections (and everything in them) that have
    no changes anywhere in their subtree, so the compiled diff only contains
    pages for the parts of a document that actually changed. A dropped
    section's heading line is kept (bare, if its own body is unchanged) when
    a descendant section survives, so the reader still has context; the
    document preamble (before the first heading, e.g. `#import` and the
    `diff-added`/`diff-deleted` definitions) is always kept in full."""
    root = _parse_sections(text)
    return "\n".join(_render_section(root, keep_body=True))


# ---- Dangling cross-reference neutralization ----
# Chapter files reference labels declared in *other* chapter files (a bid's
# `>label` link, a `[text](label)` cell link, or `#link(<label>)[text]` in
# prose — see e.g. `1d.typ`'s `#link(<sec:v1N>)[...]`, which targets a label
# declared in `defences.typ`). Compiling a single diffed file standalone (no
# `#include` chain, so those other files' labels never exist) already fails
# to compile even without any of the diffing above — try `typst compile
# 1d.typ` on an unmodified checkout. Pruning makes it worse: a reference can
# now dangle even when its target used to be in the *same* file, if the
# section containing the target got pruned out as unchanged. Rather than
# reconstructing the whole book to resolve these, references to any label
# that isn't in the (pruned) document are neutralized to plain text — the
# diff loses those specific cross-reference links, not correctness.

LINK_REF_RE = re.compile(r"#link\(<([\w:.\-]+)>\)\[([^\]]*)\]")
LABEL_RE = re.compile(r"<([\w:.\-]+)>")
CELL_LINK_RE = re.compile(r"\[([^\]]*)\]\(([^)]*)\)")


def _declared_labels(text):
    without_refs = LINK_REF_RE.sub("", text)
    return set(LABEL_RE.findall(without_refs))


def _neutralize_cell_links(text, declared):
    def repl(m):
        inner, name = m.group(1), m.group(2)
        return inner if name.strip() not in declared else m.group(0)

    return CELL_LINK_RE.sub(repl, text)


def _neutralize_bt_line(line, declared):
    r = btfmt.parse_row(line)
    if r.kind == "blank":
        return line
    if r.kind == "hdr":
        new_text = _neutralize_cell_links(r.text, declared)
        return r.prefix + "= " + new_text if new_text != r.text else line

    bid, desc, changed = r.bid, r.desc, False
    if ">" in bid:
        target = bid.split(">", 1)[1].strip()
        if target not in declared:
            bid = bid.split(">", 1)[0].strip()
            changed = True
    if desc is not None:
        new_desc = _neutralize_cell_links(desc, declared)
        if new_desc != desc:
            desc, changed = new_desc, True
    if not changed:
        return line
    return r.prefix + bid if desc is None else f"{r.prefix}{bid}  {desc}"


def neutralize_dangling_links(text):
    declared = _declared_labels(text)
    out = []
    in_bt = False
    for line in text.split("\n"):
        if OPEN_RE.match(line):
            in_bt = True
            out.append(line)
        elif CLOSE_RE.match(line):
            in_bt = False
            out.append(line)
        elif in_bt:
            out.append(_neutralize_bt_line(line, declared))
        else:
            out.append(LINK_REF_RE.sub(lambda m: m.group(2) if m.group(1) not in declared else m.group(0), line))
    return "\n".join(out)


def run_typdiff(old_path, new_path):
    r = subprocess.run(["typdiff", old_path, new_path], capture_output=True, text=True)
    if r.returncode != 0:
        raise RuntimeError(f"typdiff failed: {r.stderr}")
    return r.stdout


def process(old_text, new_text, work_old_path, work_new_path):
    old_blocks = extract_bt_blocks(old_text)
    new_blocks = extract_bt_blocks(new_text)

    old_hash = {id(b): content_hash(b["body"]) for b in old_blocks}
    new_hash = {id(b): content_hash(b["body"]) for b in new_blocks}
    common_hashes = set(old_hash.values()) & set(new_hash.values())

    pairs, added, deleted = pair_changed_blocks(old_blocks, new_blocks, old_hash, new_hash, common_hashes)

    # token assignment
    old_token = {}
    new_token = {}
    substitution = {}  # token -> final replacement text (multi-line, no trailing newline)

    for b in old_blocks:
        h = old_hash[id(b)]
        if h in common_hashes:
            tok = f"ph-u-{h}"
            old_token[id(b)] = tok
            substitution[tok] = f'{b["indent"]}#bt(```\n{b["body"]}\n{b["indent"]}```)'
    for b in new_blocks:
        h = new_hash[id(b)]
        if h in common_hashes:
            tok = f"ph-u-{h}"
            new_token[id(b)] = tok
            # already set above (identical body -> identical substitution)

    for idx, (ob, nb) in enumerate(pairs):
        tok_old = f"ph-mod-{idx}-old"
        tok_new = f"ph-mod-{idx}-new"
        old_token[id(ob)] = tok_old
        new_token[id(nb)] = tok_new
        diffed = btdiff.diff_bt_block(ob["body"], nb["body"])
        substitution[tok_new] = f'{nb["indent"]}#bt(```\n{diffed}\n{nb["indent"]}```)'
        substitution[tok_old] = None  # discard; represented via tok_new's row-level diff

    for idx, nb in enumerate(added):
        tok = f"ph-add-{idx}"
        new_token[id(nb)] = tok
        rendered = btdiff.all_added(nb["body"])
        substitution[tok] = f'{nb["indent"]}#bt(```\n{rendered}\n{nb["indent"]}```)'

    for idx, ob in enumerate(deleted):
        tok = f"ph-del-{idx}"
        old_token[id(ob)] = tok
        rendered = btdiff.all_deleted(ob["body"])
        substitution[tok] = f'{ob["indent"]}#bt(```\n{rendered}\n{ob["indent"]}```)'

    ph_old_text = build_placeholder_text(old_text, old_blocks, lambda b: old_token[id(b)])
    ph_new_text = build_placeholder_text(new_text, new_blocks, lambda b: new_token[id(b)])

    with open(work_old_path, "w", encoding="utf-8") as f:
        f.write(ph_old_text)
    with open(work_new_path, "w", encoding="utf-8") as f:
        f.write(ph_new_text)

    merged = run_typdiff(work_old_path, work_new_path)

    # Substitute placeholders back in. A discarded (None) token's line —
    # typdiff will have commented it out, e.g. `// #ph-mod-0-old` — is
    # dropped entirely, since its content already appears via the paired
    # row-level-diffed table.
    out_lines = []
    token_re = re.compile(r"^(\s*)(//\s*)?#(ph-(?:u|mod|add|del)-[\w-]+)\s*$")
    for line in merged.split("\n"):
        m = token_re.match(line)
        if not m:
            out_lines.append(line)
            continue
        tok = m.group(3)
        repl = substitution.get(tok)
        if repl is None:
            continue  # discarded old-side of a modified pair
        out_lines.append(repl)
    pruned = prune_unchanged_sections("\n".join(out_lines))
    return neutralize_dangling_links(pruned)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("files", nargs="+", help="OLD NEW, or just NEW with --neutralize-only")
    ap.add_argument("-o", "--output")
    ap.add_argument(
        "--neutralize-only",
        action="store_true",
        help="No OLD to diff against (e.g. a brand-new file) — just neutralize dangling "
        "cross-file references in FILES[0] so it compiles standalone, with no diff markup.",
    )
    args = ap.parse_args()

    if args.neutralize_only:
        if len(args.files) != 1:
            ap.error("--neutralize-only takes exactly one file")
        with open(args.files[0], encoding="utf-8") as f:
            result = neutralize_dangling_links(f.read())
    else:
        if len(args.files) != 2:
            ap.error("expected OLD NEW")
        old_path, new_path = args.files
        with open(old_path, encoding="utf-8") as f:
            old_text = f.read()
        with open(new_path, encoding="utf-8") as f:
            new_text = f.read()
        result = process(old_text, new_text, old_path + ".ph.typ", new_path + ".ph.typ")

    # Chapter files are normally only ever compiled as part of the whole book,
    # where `lak.typ` applies `conf` (heading numbering, page setup, …) once.
    # Compiled standalone here, headings are unnumbered by default, which
    # breaks any `#ref(<label>)` to a heading (it needs a number to show) —
    # so replicate just the numbering scheme. The resulting numbers won't
    # match the real book (only this one file's headings are present), but
    # that's a cosmetic gap in an isolated diff preview, not a compile error.
    result = '#set heading(numbering: "1.1.1.1")\n' + result

    if args.output:
        with open(args.output, "w", encoding="utf-8") as f:
            f.write(result)
    else:
        sys.stdout.write(result)


if __name__ == "__main__":
    main()
