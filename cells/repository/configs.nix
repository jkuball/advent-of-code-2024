{
  inputs,
  cell,
}: let
  inherit (inputs.std.lib.dev) mkNixago;
  inherit (cell.nixpkgs) pkgs;
  inherit (pkgs) lib;
in {
  treefmt = mkNixago {
    output = "treefmt.toml";

    commands = [
      {package = with pkgs; treefmt;}
    ];

    data.formatter.nix = {
      command = lib.getExe (with pkgs; alejandra);
      includes = ["*.nix"];
    };
  };
}
