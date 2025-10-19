{ config, pkgs, ... }:
{
  programs.niri.settings.spawn-at-startup =
    [
      {
        command = [
          "wl-paste"
          "--watch"
          "cliphist"
          "store"
        ];
      }
      {
        command = [
          "wl-paste"
          "--type text"
          "--watch"
          "cliphist"
          "store"
        ];
      }
      { command = [ "fcitx5" ]; }
      { command = [ "swww-daemon" ]; }
      {
        command = [
          "swww"
          "img"
          "/home/phil_oh/Pictures/Wallpapers/nature-blur.png"
        ];
      }
    ];
}
