{
  description = "Occult Themes";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };
  };

  outputs = {
    flake-parts,
    nixpkgs,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = [ "x86_64-linux" "aarch64-linux" ];
      perSystem = {...}: {
        flake.lib.themes = {
          occult-umbral = builtins.fromJSON(builtins ./themes/occult-umbral.json);
          occult = builtins.fromJSON(builtins.readFile ./themes/occult.json);
        };
      };
    };
}
