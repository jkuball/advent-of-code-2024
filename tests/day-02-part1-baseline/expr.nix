{
  inputs,
  mkTest,
}: let
  inherit (inputs.nixpkgs) system;
  inherit (inputs.aoc.${system}.code) challenges;
in
  mkTest {
    challenge = challenges.day-02-part1;
    fixture = ../__fixtures/day-02/baseline.txt;
  }
