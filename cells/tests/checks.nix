{
  inputs,
  cell,
}: let
  inherit (inputs) namaka self;
  inputs' = builtins.removeAttrs inputs ["self"];
in {
  snapshots = {
    check = namaka.lib.load {
      src = self + /tests;
      inputs = inputs' // {
        inputs = inputs';
      };
    };
  };
}
