# vector-trade-quote-pipe

`vector-trade-quote-pipe` explores trading systems with a small Zig codebase and local fixtures. The technical goal is to design a Zig verification harness for quote systems, covering storage recovery, log and snapshot fixtures, and failure-oriented tests.

## Use Case

This is intentionally local and self-contained so it can be inspected without credentials, services, or seeded history.

## Vector Trade Quote Pipe Review Notes

For a quick review, compare `fill risk` with `spread pressure` before reading the middle cases.

## Highlights

- `fixtures/domain_review.csv` adds cases for spread pressure and fill risk.
- `metadata/domain-review.json` records the same cases in structured form.
- `config/review-profile.json` captures the read order and the two review questions.
- `examples/vector-trade-quote-walkthrough.md` walks through the case spread.
- The Zig code includes a review path for `fill risk` and `spread pressure`.
- `docs/field-notes.md` explains the strongest and weakest cases.

## Code Layout

The implementation keeps the scoring rule plain: reward signal and confidence, preserve slack, penalize drag, then classify the result into a review lane.

The Zig implementation avoids hidden state so fixture changes are easy to reason about.

## Run The Check

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

## Regression Path

That command is also the regression path. It verifies the domain cases and catches mismatches between the CSV, metadata, and code.

## Future Work

The repository is intentionally scoped to local checks. I would expand it by adding adversarial fixtures before adding features.
