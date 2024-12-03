{
  inputs,
  cell,
}: let
  inherit (inputs.std.lib.dev) mkShell;
in {
  default = mkShell {
    name = "AoC 2024";

    nixago = with cell.configs; [
      treefmt
    ];
  };

  book = mkShell {
    name = "AoC 2024: Book";

    nixago = with cell.configs; [
      mdbook
    ];
  };
}
