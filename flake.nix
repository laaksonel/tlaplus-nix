{
  description = "TLA+ development environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" "x86_64-darwin" ];
      perSystem = { config, self', inputs', pkgs, system, ... }:
        let
          jdk = pkgs.openjdk19_headless;
        in
        {
          devShells.default = pkgs.mkShell {
            packages = [
              jdk
            ];

            shellHooks = ''
              export JAVA_HOME=${jdk}
            '';
          };
        };
    };
}
