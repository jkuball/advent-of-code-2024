{
  inputs,
}: let
  inherit (inputs) nixpkgs;
  inherit (inputs.nixpkgs) system lib;
  inherit (inputs.aoc.${system}.code) challenges;

  runnable = lib.getExe challenges.day-01-part1;
  fixtures = ./__fixtures;

  command = nixpkgs.runCommand "day-01-baseline" {} ''
    ${runnable} < ${fixtures}/example.txt > $out
    '';
in
  builtins.readFile "${command}"
