{ config, pkgs, ... }:
{
  programs.niri.settings = {
    screenshot-path = "~/Pictures/Screenshots/%Y-%m-%d %H-%M-%S.png";
    prefer-no-csd = true;
    cursor = {
      hide-when-typing = true;
    };
    hotkey-overlay = {
      hide-not-bound = true;
      skip-at-startup = true;
    };
  };
}
