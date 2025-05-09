{ config, pkgs, ... }:

{

  home.packages = with pkgs; [
    silicon
  ];

  home.file = {
    ".config/silicon/themes" = {
      source = ./themes;
      recursive = true;
    };
  };

}
