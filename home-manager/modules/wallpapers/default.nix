{ config, pkgs, ... }:
{
  home = {
    file."${config.home.homeDirectory}/Pictures/wallpapers".source = ./wallpapers;
  };
}
