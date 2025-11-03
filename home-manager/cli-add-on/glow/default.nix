{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    glow
  ];

  home.file = {
    ".config/glow/glow.yml" = {
      source = ./glow.yml;
    };
    ".config/glow/catppuccin-mocha.json" = {
      source = ./catppuccin-mocha.json;
    };
  };
}
