{inputs, cell}:
let
  inherit (inputs) haumea;
  inherit (haumea.lib) transformers;
in haumea.lib.load {
  src = ./days;
  inputs = { inherit inputs cell; };
  transformer = [ transformers.liftDefault ];
}
