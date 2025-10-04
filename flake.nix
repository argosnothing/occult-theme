{
  description = "Occult Themes";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = {...} @ inputs: {
    themes = {
      occult-umbral = builtins.fromJSON (builtins.readFile ./themes/occult-umbral.json);
      occult = builtins.fromJSON (builtins.readFile ./themes/occult.json);
    };
  };
}
