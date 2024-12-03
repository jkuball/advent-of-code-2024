{
  inputs,
  cell,
}: let
  inherit (inputs) nixpkgs;
in {
  pkgs = import nixpkgs {
    inherit (nixpkgs) system;
  };
}
