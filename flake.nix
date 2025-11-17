
{
  description = "nvim dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, utils, ... }:
    utils.lib.eachDefaultSystem (
      system: let
        pkgs = import nixpkgs {inherit system;};
        runDeps = with pkgs; [
          lua-language-server
          stylua
        ];
      in {
        devShells.default = pkgs.mkShell rec {
          buildInputs = runDeps;
        };
      }
    );
}
