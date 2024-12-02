{
  description = "Advent of Code 2024 in standard nix.";

  outputs = {
    self,
    std,
    ...
  } @ inputs:
    std.growOn {
      inherit inputs;
      cellsFrom = ./cells;
      cellBlocks = with std.blockTypes; [
        (devshells "devshells")
        (nixago "configs")
        (pkgs "nixpkgs")

        (namaka "checks")
        (runnables "code")
        (runnables "challenges")
      ];
    }
    {
      devShells = std.harvest self ["repository" "devshells"];
      packages = std.harvest self ["code" "challenges"];

      # TODO: this gets to problems with `nix flake show`.
      # checks = std.harvest self ["tests" "checks" "snapshots" "check"];
    };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    haumea.url = "github:nix-community/haumea";

    std.url = "github:divnix/std";
    std.inputs.nixpkgs.follows = "nixpkgs";
    std.inputs.devshell.url = "github:numtide/devshell";
    std.inputs.haumea.follows = "haumea";
    std.inputs.nixago.url = "github:nix-community/nixago";

    namaka.url = "github:nix-community/namaka";
    namaka.inputs.nixpkgs.follows = "nixpkgs";
  };
}
