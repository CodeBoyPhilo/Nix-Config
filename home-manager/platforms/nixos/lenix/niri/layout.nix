{ config, pkgs, ... }:
let
  stylix-colors = config.lib.stylix.colors;
in
{
  programs.niri.settings.layout = {
    gaps = 16;
    center-focused-column = "never";
    preset-column-widths = [
      { proportion = 1. / 3.; }
      { proportion = 0.5; }
      { proportion = 2. / 3.; }
    ];
    default-column-width = {
      proportion = 2. / 3.;
    };
    focus-ring = {
      enable = false;
      width = 2;
      active.color = "#${stylix-colors.base06}";
      inactive.color = "#${stylix-colors.base00}";
    };
    border = {
      enable = true;
      width = 2;
      active.color = "#${stylix-colors.base06}";
      inactive.color = "#${stylix-colors.base00}";
      urgent.color = "#${stylix-colors.base0E}";
    };
    tab-indicator = {
      position = "left";
      width = 8.0;
    };
    shadow = {
      enable = false;
      softness = 30;
      spread = 5;
      offset = {
        x = 0;
        y = 5;
      };
      color = "#0007";
    };
  };
}
