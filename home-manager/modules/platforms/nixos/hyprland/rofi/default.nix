{
  config,
  pkgs,
  lib,
  ...
}:
{
  home.packages = with pkgs; [
    rofi-wayland
  ];

  home = {
    file."${config.xdg.configHome}/rofi/colors-rofi.rasi".source = ./rofi/colors-rofi.rasi;
    file."${config.xdg.configHome}/rofi/config.rasi".source = ./rofi/config.rasi;
    file."${config.xdg.configHome}/rofi/fonts.rasi".source = ./rofi/fonts.rasi;
    file."${config.xdg.configHome}/rofi/mocha.rasi".source = ./rofi/mocha.rasi;
  };

}
