{
  description = "Template for TLA+ development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "aarch64-darwin" "aarch64-linux" "x86_64-linux" "x86_64-darwin" ];

      perSystem = { config, self', inputs', pkgs, system, ... }: {
        packages.default = pkgs.runCommand "tlaplus"
          {
            src = ./template/tlaplus;
          } ''
          mkdir -p $out
          cp --no-preserve=mode -r $src/* $out
        '';
      };

      flake = {
        templates = {
          default = {
            description = "TLA+ development environment";
            path = ./template/tlaplus;
          };
        };
      };
    };
}
