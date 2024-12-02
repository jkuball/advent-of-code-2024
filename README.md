# Advent of Code 2024

This is the first year I want to participate in [Advent of Code](https://adventofcode.com/). In the past years I always skipped it, because .. yeah. Why not.

And, just because I can, I want to use a different programming language for every day.
Nix provides me with the power to do so.

Every program is written such that it reads an example input from stdin and writes the transformed one to stdout.
You can run a specific part of a specific day directly via flake outputs: `nix flake run .#day-12-part2`.

I am also providing at least one example to run:

```bash
nix run .#day-01-part1 < tests/day-01-baseline/__fixtures/example.txt
```

You can use the [standard](https://github.com/divnix/std) cli to explore this repository and everything it provides: `nix run github:divnix/std`.

## Overview

| Day | Language | Status Part 1 | Status Part 2 |
| --- | -------- | ------------- | ------------- |
| 01  | bash     | `DONE`        | `OPEN`        |
| 02  |          | `OPEN`        | `LOCK`        |
| 03  |          | `TBD`         | `TBD`         |

