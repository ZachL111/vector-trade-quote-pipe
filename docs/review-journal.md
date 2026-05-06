# Review Journal

I treated `vector-trade-quote-pipe` as a project where the smallest useful behavior should still be inspectable.

The local checks classify each case as `ship`, `watch`, or `hold`. That gives the project a small review vocabulary that matches its trading systems focus without claiming live deployment or external usage.

## Cases

- `baseline`: `spread pressure`, score 114, lane `watch`
- `stress`: `fill risk`, score 240, lane `ship`
- `edge`: `portfolio drift`, score 171, lane `ship`
- `recovery`: `quote width`, score 196, lane `ship`
- `stale`: `spread pressure`, score 166, lane `ship`

## Note

A future change should add new cases before it changes the scoring rule.
