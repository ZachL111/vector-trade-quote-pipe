# Vector Trade Quote Pipe Walkthrough

The fixture is intentionally compact, so the review starts with the cases that pull farthest apart.

| Case | Focus | Score | Lane |
| --- | --- | ---: | --- |
| baseline | spread pressure | 114 | watch |
| stress | fill risk | 240 | ship |
| edge | portfolio drift | 171 | ship |
| recovery | quote width | 196 | ship |
| stale | spread pressure | 166 | ship |

Start with `stress` and `baseline`. They create the widest contrast in this repository's fixture set, which makes them better review anchors than the middle cases.

`stress` is the optimistic case; use it to make sure the scoring path still rewards strong signal.
