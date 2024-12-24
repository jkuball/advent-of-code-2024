{ pkgs }:
pkgs.writers.writeFishBin "aoc-2024-day02-part1"
  (builtins.readFile ./__code.fish)
