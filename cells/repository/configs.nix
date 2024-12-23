{ inputs
, cell
}:
let
  inherit (inputs.std.lib.dev) mkNixago;
  inherit (inputs.mdbook-paisano-preprocessor.app.package) mdbook-paisano-preprocessor;
  inherit (cell.nixpkgs) pkgs;
  inherit (pkgs) lib;
in
{
  treefmt = mkNixago {
    output = "treefmt.toml";

    commands = [
      { package = with pkgs; treefmt; }
    ];

    data.formatter.nix = {
      command = lib.getExe (with pkgs; nixpkgs-fmt);
      includes = [ "*.nix" ];
    };
  };

  github-workflow-book = mkNixago {
    output = ".github/workflows/book.yaml";
    hook.mode = "copy";

    data = {
      name = "Deploy to GitHub Pages";
      on.push.branches = [ "main" ];

      jobs.deploy = {
        runs-on = "ubuntu-latest";
        concurrency.group = "\${{ github.workflow }}-\${{ github.ref }}";
        permissions = {
          id-token = "write";
          pages = "write";
        };
        environment = {
          name = "github-pages";
          url = "\${{ steps.deployment.outputs.page_url }}";
        };
        steps = [
          { uses = "actions/checkout@v4"; }
          { uses = "nixbuild/nix-quick-install-action@v29"; }
          { run = "nix develop .#book -c mdbook build ./."; }
          {
            "if" = "\${{ github.ref == 'refs/heads/main' }}";
            uses = "actions/upload-pages-artifact@v3";
            "with".path = "./docs/book/";
          }
          {
            "if" = "\${{ github.ref == 'refs/heads/main' }}";
            id = "deployment";
            uses = "actions/deploy-pages@v4";
          }
        ];
      };
    };
  };

  mdbook = mkNixago {
    output = "book.toml";
    hook.mode = "copy";

    packages = with pkgs; [
      mdbook
      mdbook-paisano-preprocessor
    ];

    data = {
      book = {
        title = "Advent of Code 2024 - A report.";
        language = "en";
        multilingual = false;
        src = "docs";
      };
      build.build-dir = "docs/book";
      preprocessor.paisano-preprocessor = {
        before = [ "links" ];
        registry = ".#__std.init";

        multi = [
          {
            cell = "code";
            chapter = "show me the code";
          }
        ];
      };
    };
  };
}
