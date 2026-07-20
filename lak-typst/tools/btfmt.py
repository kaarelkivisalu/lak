#!/usr/bin/env python3
"""Auto-align the description column inside `#bt(``` … ```)` blocks.

Bid tables are authored as indentation-nested `bid  description` lines. Getting
the description column to line up by hand is tedious, so this tool does it: for
every `#bt` block it finds, it re-pads each row so that descriptions align,
independently within each group of sibling rows (i.e. rows sharing the same
parent — the same units that render as one sub-table).

It only ever touches the run of spaces between a bid and its description; bid
text, `>label` links, `= header` rows, indentation and `{ … }` cells are
preserved exactly. A `* ` highlight marker is normalized to lead the line
(before any indentation spaces) so highlighted rows line up in one column
regardless of nesting depth — Typst's own parser doesn't require this and
still accepts `*` anywhere after indentation, so this is purely a formatting
convention.

Usage (run from lak-typst/, or point paths at it from elsewhere):
    uv run --project tools tools/btfmt.py FILE.typ [FILE.typ …]  # rewrite in place
    uv run --project tools tools/btfmt.py --check FILE.typ …     # exit 1 if any file would change
    uv run --project tools tools/btfmt.py --stdout FILE.typ      # print result, don't write
    uv run --project tools tools/btfmt.py --gutter N FILE.typ …  # spaces before description (default 3)
"""

import re
import sys
from dataclasses import dataclass
from typing import Optional

OPEN_RE = re.compile(r'^(\s*)#bt\(```\s*$')
CLOSE_RE = re.compile(r'^```\)\s*$')
SEP_RE = re.compile(r' {2,}')


@dataclass
class Row:
    kind: str            # 'row', 'hdr', or 'blank'
    prefix: str = ''     # indentation + optional '* ' marker
    col0: int = 0        # column where the bid begins
    bid: str = ''
    desc: Optional[str] = None
    text: str = ''       # header text (kind == 'hdr')
    gid: int = -1        # sibling-group id, filled in later

    @property
    def bid_end(self) -> int:
        return self.col0 + len(self.bid)


def parse_row(line: str) -> Row:
    """Describe one content line of a #bt block."""
    if line.strip() == '':
        return Row(kind='blank')
    lead = len(line) - len(line.lstrip(' '))
    body = line[lead:]
    hl = body.startswith('* ')
    if hl:
        rest = body[2:].lstrip(' ')
        lead += len(body) - 2 - len(rest)
        body = rest
    content = body
    prefix = ('* ' if hl else '') + ' ' * lead
    col0 = len(prefix)

    if content.startswith('= '):
        return Row(kind='hdr', prefix=prefix, col0=col0, text=content[2:].rstrip())

    if ' | ' in content:
        bid, desc = content.split(' | ', 1)
        bid, desc = bid.rstrip(), desc.strip()
    else:
        m = SEP_RE.search(content)
        if m:
            bid, desc = content[:m.start()].rstrip(), content[m.end():].strip()
        else:
            bid, desc = content.rstrip(), None
    return Row(kind='row', prefix=prefix, col0=col0, bid=bid, desc=desc)


def assign_groups(rows: list[Row]) -> None:
    """Give each row a sibling-group id (same parent => same id)."""
    stack: list[tuple[int, int]] = []  # (col0, gid)
    nxt = 0
    for r in rows:
        if r.kind == 'blank':
            continue
        while stack and stack[-1][0] > r.col0:
            stack.pop()
        if stack and stack[-1][0] == r.col0:
            r.gid = stack[-1][1]
        else:
            r.gid = nxt
            stack.append((r.col0, nxt))
            nxt += 1


def format_block(lines: list[str], gutter: int) -> list[str]:
    rows = [parse_row(l) for l in lines]
    assign_groups(rows)

    # description column per group = max bid_end among rows that have a desc
    desc_col: dict[int, int] = {}
    for r in rows:
        if r.kind == 'row' and r.desc is not None:
            desc_col[r.gid] = max(desc_col.get(r.gid, 0), r.bid_end)
    desc_col = {g: c + gutter for g, c in desc_col.items()}

    out = []
    for r in rows:
        if r.kind == 'blank':
            out.append('')
        elif r.kind == 'hdr':
            out.append(r.prefix + '= ' + r.text)
        elif r.desc is None:
            out.append(r.prefix + r.bid)
        else:
            out.append(r.prefix + r.bid + ' ' * (desc_col[r.gid] - r.bid_end) + r.desc)
    return out


def format_text(text: str, gutter: int) -> str:
    lines = text.split('\n')
    out: list[str] = []
    i, n = 0, len(lines)
    while i < n:
        line = lines[i]
        if OPEN_RE.match(line):
            out.append(line)
            j = i + 1
            body = []
            while j < n and not CLOSE_RE.match(lines[j]):
                body.append(lines[j])
                j += 1
            out.extend(format_block(body, gutter))
            if j < n:
                out.append(lines[j])  # closing ```)
            i = j + 1
        else:
            out.append(line)
            i += 1
    return '\n'.join(out)


def main(argv):
    gutter, check, to_stdout, files = 3, False, False, []
    it = iter(argv)
    for a in it:
        if a == '--gutter':
            gutter = int(next(it))
        elif a == '--check':
            check = True
        elif a == '--stdout':
            to_stdout = True
        else:
            files.append(a)
    if not files:
        print(__doc__)
        return 2

    changed = False
    for path in files:
        with open(path, encoding='utf-8') as f:
            src = f.read()
        result = format_text(src, gutter)
        if result != src:
            changed = True
            if to_stdout:
                sys.stdout.write(result)
            elif check:
                print(f'would reformat {path}')
            else:
                with open(path, 'w', encoding='utf-8') as f:
                    f.write(result)
                print(f'reformatted {path}')
        elif to_stdout:
            sys.stdout.write(result)
    return 1 if (check and changed) else 0


if __name__ == '__main__':
    sys.exit(main(sys.argv[1:]))
