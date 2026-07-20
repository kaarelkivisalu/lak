"""Row-level diff for `#bt(``` … ```)` blocks.

`typdiff` (the whole-document Typst diff tool the PR-diff pipeline otherwise
relies on) treats every `#bt(...)` call as one opaque, indivisible unit: any
change anywhere inside it comments out the entire old table and drops in the
entire new one unstyled, so the rendered PDF shows no visual indication that
anything changed. This module diffs two versions of a bt block at row
granularity instead, reusing `btfmt.py`'s existing row parser (bid / desc /
indent / sibling-group), and re-emits the block with `+ `/`- ` sentinel
prefixes that `lib.typ`'s `bt` renderer (see `_parse-row` in lib.typ) turns
into the same blue-underline / red-strikethrough convention `typdiff` uses
for prose.

Rows are matched primarily by bid label (the stable identity of a row, like
matching on words in a prose diff) via difflib, recursing into `followups`
children independently of whether the parent row itself changed.
"""

import difflib
import re
from dataclasses import dataclass, field

import btfmt


@dataclass
class Node:
    raw: str
    row: "btfmt.Row"
    children: list = field(default_factory=list)


def _fold(items, start, base):
    nodes = []
    i = start
    while i < len(items):
        r, raw = items[i]
        if r.col0 < base:
            break
        i += 1
        node = Node(raw=raw, row=r)
        if i < len(items) and items[i][0].col0 > r.col0:
            children, i = _fold(items, i, items[i][0].col0)
            node.children = children
        nodes.append(node)
    return nodes, i


def build_tree(body_lines):
    items = [(btfmt.parse_row(line), line) for line in body_lines if line.strip() != ""]
    if not items:
        return []
    nodes, _ = _fold(items, 0, min(r.col0 for r, _ in items))
    return nodes


def _norm(s):
    return re.sub(r"\s+", " ", (s or "").strip())


def row_key(r):
    """Identity used to align rows across old/new — bid label, ignoring meaning."""
    if r.kind == "hdr":
        return ("hdr", _norm(r.text))
    bid = r.bid.split(">")[0]  # drop a `>label` link suffix
    return ("row", _norm(bid))


def row_semantic(r):
    """Full content used to decide whether a matched row actually changed."""
    hl = r.prefix.strip().startswith("*")
    if r.kind == "hdr":
        return ("hdr", _norm(r.text), hl)
    return ("row", _norm(r.bid), _norm(r.desc), hl)


def _sentinel(raw, sign):
    stripped = raw.lstrip(" ")
    lead = raw[: len(raw) - len(stripped)]
    return f"{lead}{sign} {stripped}"


def _render_all(node, sign):
    out = [_sentinel(node.raw, sign)]
    for c in node.children:
        out.extend(_render_all(c, sign))
    return out


def diff_nodes(old_nodes, new_nodes):
    lines = []
    ok = [row_key(n.row) for n in old_nodes]
    nk = [row_key(n.row) for n in new_nodes]
    sm = difflib.SequenceMatcher(None, ok, nk, autojunk=False)
    for tag, i1, i2, j1, j2 in sm.get_opcodes():
        if tag == "equal":
            for oi, nj in zip(range(i1, i2), range(j1, j2)):
                on, nn = old_nodes[oi], new_nodes[nj]
                if row_semantic(on.row) == row_semantic(nn.row):
                    lines.append(nn.raw)
                else:
                    lines.append(_sentinel(on.raw, "-"))
                    lines.append(_sentinel(nn.raw, "+"))
                lines.extend(diff_nodes(on.children, nn.children))
        elif tag == "delete":
            for oi in range(i1, i2):
                lines.extend(_render_all(old_nodes[oi], "-"))
        elif tag == "insert":
            for nj in range(j1, j2):
                lines.extend(_render_all(new_nodes[nj], "+"))
        elif tag == "replace":
            for oi in range(i1, i2):
                lines.extend(_render_all(old_nodes[oi], "-"))
            for nj in range(j1, j2):
                lines.extend(_render_all(new_nodes[nj], "+"))
    return lines


def diff_bt_block(old_body, new_body):
    """Diff two bt block bodies (the raw text between the backtick fences).

    Returns the annotated body text (no surrounding ```` ```) fences).
    """
    old_tree = build_tree(old_body.split("\n"))
    new_tree = build_tree(new_body.split("\n"))
    return "\n".join(diff_nodes(old_tree, new_tree))


def all_added(body):
    tree = build_tree(body.split("\n"))
    out = []
    for n in tree:
        out.extend(_render_all(n, "+"))
    return "\n".join(out)


def all_deleted(body):
    tree = build_tree(body.split("\n"))
    out = []
    for n in tree:
        out.extend(_render_all(n, "-"))
    return "\n".join(out)
