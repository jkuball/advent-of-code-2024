{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs;
in nixpkgs.writeShellApplication {
    name = "aoc-2024-day01-part1";
    text = builtins.readFile ./__code.bash;
  }
