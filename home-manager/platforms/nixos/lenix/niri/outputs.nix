{ config, pkgs, ... }:
{
  programs.niri.settings.outputs = {
    "HDMI-A-3" = {
      scale = 1.0;
      position = {
        x = 0;
        y = 0;
      };
      focus-at-startup = true;
    };
    "HDMI-A-4" = {
      scale = 0.67;
      position = {
        x = -1620;
        y = -470;
      };
      transform.rotation = 90;
    };
  };
}
