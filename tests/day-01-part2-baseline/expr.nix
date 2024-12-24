{ inputs
, mkTest
,
}:
let
  inherit (inputs.nixpkgs) system;
  inherit (inputs.aoc.${system}.code) challenges;
in
mkTest {
  challenge = challenges.day-01-part2;
  fixture = ../__fixtures/day-01/baseline.txt;
}
