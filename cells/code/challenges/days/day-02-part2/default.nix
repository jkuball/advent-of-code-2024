{pkgs}:
pkgs.writers.writeFishBin "aoc-2024-day02-part2"
(builtins.readFile ./__code.fish)
