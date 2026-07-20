# Tools

Python helpers for the Typst edition, kept separate from the document content
in `lak-typst/`. Zero third-party dependencies — `pyproject.toml` exists so
[uv](https://docs.astral.sh/uv/) can pin a Python version and give these a
project context, not because anything here needs installing.

Run everything with `uv run --project tools tools/<script>.py …` from
`lak-typst/` (or adjust paths accordingly from elsewhere).

- **`btfmt.py`** — aligns the description column inside `#bt(…)` blocks. See
  the "Auto-formatting" section of [`../README.md`](../README.md) for usage.
- **`btdiff.py`** — row-level diff for `#bt(…)` bid tables. `typdiff` (the
  whole-document Typst diff tool the PR visual-diff workflow otherwise relies
  on) treats a whole bid table as one opaque block, so on its own it shows no
  indication that anything inside a table changed; this reuses `btfmt.py`'s
  row parser to diff tables row-by-row instead. Not a standalone CLI — used
  as a library by `typst_pr_diff.py`.
- **`typst_pr_diff.py`** — combines `typdiff` (prose) with `btdiff.py`
  (tables) into a single per-file visual diff, and prunes sections/subsections
  that didn't change out of the result. Backs `.github/workflows/typst-pr-diff.yaml`.
  ```sh
  uv run --project tools tools/typst_pr_diff.py OLD.typ NEW.typ -o OUT.typ
  ```
