{
  config,
  pkgs,
  lib,
  inputs,
  ...
}:
let
  presets = {
    catppuccin-mocha = {
      base00 = "1e1e2e"; #1e1e2e base
      base01 = "313244"; #313244 surface0
      base02 = "45475a"; #45475a surface1
      base03 = "585b70"; #585b70 surface2
      base04 = "a6adc8"; #a6adc8 subtext
      base05 = "cdd6f4"; #cdd6f4 text
      base06 = "b4befe"; #b4befe lavender
      base07 = "89b4fa"; #89b4fa blue
      base08 = "74c7ec"; #74c7ec sapphire
      base09 = "89dceb"; #89dceb sky
      base0A = "94e2d5"; #94e2d5 teal
      base0B = "a6e3a1"; #a6e3a1 green
      base0C = "f9e2af"; #f9e2af yellow
      base0D = "fab387"; #fab387 yellow
      base0E = "f38ba8"; #f38ba8 red
      base0F = "cba6f7"; #cba6f7 mauve
    };
  };
in
{
  stylix = {
    enable = true;
    autoEnable = false;
    polarity = "dark";
    image = ../wallpapers/wallpapers/Nature.png;
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 24;
    };
    base16Scheme = presets.catppuccin-mocha;
  };
}
