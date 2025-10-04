{
  description = "Occult Themes";
  outputs = _: {
    themes = {
      occult-umbral = builtins.fromJSON (builtins.readFile ./themes/occult-umbral.json);
      occult = builtins.fromJSON (builtins.readFile ./themes/occult.json);
    };
  };
}
