# Advent of Code 2024

This is the first year I want to participate in [Advent of Code](https://adventofcode.com/).
In the past years I always skipped it, because .. yeah.
Why not.

And, just because I can, I want to use a different programming language for every day.
Nix provides me with the power to do so.

Every program is written such that it reads an example input from stdin and writes the transformed one to stdout.

You can run a specific part of a specific day directly via flake outputs.
It is not needed to clone this repository, you could just run it on a system with a flake-enabled nix.

```bash
nix run github:jkuball/advent-of-code-2024#day-12-part2

# (keep in mind that this waits for input from stdin)
```

I am also providing the usual example input and my own challenge input.

```bash
nix run .#day-01-part1 < tests/__fixtures/day-01/baseline.txt

# or using the standard cli
std //code/challenges/day-01-part2:run < tests/__fixtures/day-01/challenge.txt
```

You can use the [standard](https://github.com/divnix/std) cli to explore this repository and everything it provides: `nix run github:divnix/std`.

## Overview

| Day         | Status Part 1 | Status Part 2 | Language                            |
| ----------- | ------------- | ------------- | ----------------------------------- |
| 01.12.2024  | ⭐ `DONE`     | ⭐ `DONE`     | bash (`pkgs.writeShellApplication`) |
| 02.12.2024  | ⭐ `DONE`     | ⭐ `DONE`     | fish (`pkgs.writers.writeFishBin`)  |
| 03.12.2024  | 🔜 `OPEN`     | 🔒 `LOCK`     |                                     |
| 04.12.2024  | ❓ `TBD`      | ❓ `TBD`      |                                     |

## Run the Tests

I am using [namaka](https://github.com/nix-community/namaka) for snapshot based testing.
This is the first time using `std` and `namaka` together,
and I think I did some things weirdly,
even wrongly.
Maybe I will revisit this in the future.

But right now, to run the tests, one has to update the subflake first:

```console
$ nix flake update --flake ./cells/tests
• Updated input 'aoc':
[...]

$ std //tests/checks/snapshots:check
✔ day-01-part1-baseline
✔ day-01-part1-challenge
✔ day-02-part2-baseline
✔ day-01-part2-baseline
✔ day-01-part2-challenge
✔ day-02-part2-challenge
✔ day-02-part1-baseline
✔ day-02-part1-challenge
All 8 tests succeeded
```
