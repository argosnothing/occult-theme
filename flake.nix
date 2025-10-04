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
        config.themes = builtins.listToAttrs (
          map (file: {
            name = builtins.replaceStrings [".yaml"] [""] file;
            value = builtins.fromJSON (builtins.readFile ./themes/${file});
          })
          (builtins.filter (f: builtins.match ".*\\.yaml$" f != null)
            (builtins.attrNames (builtins.readDir ./themes)))
        );
      };
    };
}
