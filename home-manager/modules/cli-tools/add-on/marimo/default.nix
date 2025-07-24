{ config, pkgs, ... }:

{

  home.packages = with pkgs; [
    marimo
  ];

  home.file = {
    ".config/marimo/themes" = {
      source = ./themes;
      recursive = true;
    };
  };

}
