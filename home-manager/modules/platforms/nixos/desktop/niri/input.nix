{ config, pkgs, ... }:
{
  programs.niri.settings.input = {
    mod-key = "Alt";
    keyboard = {
      repeat-rate = 40;
      repeat-delay = 300;
    };
    power-key-handling.enable = false;
    warp-mouse-to-focus = {
      enable = true;
      mode = "center-xy";
    };
  };
}
