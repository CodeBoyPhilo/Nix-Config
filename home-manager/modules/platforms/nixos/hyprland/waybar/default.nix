{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    waybar
  ];
  home = {
    file."${config.xdg.configHome}/waybar/config.jsonc".source = ./waybar/config.jsonc;
    file."${config.xdg.configHome}/waybar/mocha.css".source = ./waybar/mocha.css;
    file."${config.xdg.configHome}/waybar/style.css".source = ./waybar/style.css;
  };
  programs.waybar.enable = true;
}
