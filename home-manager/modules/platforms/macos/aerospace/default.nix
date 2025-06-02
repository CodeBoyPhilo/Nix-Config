{ config, pkgs, ... }:

{

  home.packages = with pkgs; [
    aerospace
  ];

  home.file = {
    ".config/aerospace/aerospace.toml" = {
      source = ./aerospace.toml;
    };
  };

}
