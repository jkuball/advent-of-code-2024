{inputs, cell}:
let
  inherit (inputs) haumea;
  inherit (haumea.lib) transformers;
  inherit (cell.nixpkgs) pkgs;
in haumea.lib.load {
  src = ./days;
  inputs = { inherit inputs cell pkgs; };
  transformer = [ transformers.liftDefault ];
}
