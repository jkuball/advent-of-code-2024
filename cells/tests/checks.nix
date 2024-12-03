{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs namaka self;
  inherit (inputs.nixpkgs) lib;

  inputs' = builtins.removeAttrs inputs ["self"];

  aoc24.mkTest = { challenge, fixture, ... }:
    let
      runnable = lib.getExe challenge;

      command = nixpkgs.runCommand "${challenge}-${fixture}" {} ''
        ${runnable} < ${fixture} > $out
      '';
    in
      builtins.readFile "${command}";
in {
  snapshots = {
    check = namaka.lib.load {
      src = self + /tests;
      inputs = inputs' // {
        inputs = inputs';
        inherit (aoc24) mkTest;
      };
    };
  };
}
