{ hostname, ... }:
{
  services = {
    hyprpaper = {
      enable = true;
      settings = {
        splash = false;
        preload = [
          "/etc/wallpapers/A.png"
        ];
        wallpaper = [
          "eDP-1, /etc/wallpapers/A.png"
        ];
      };
    };
  };
}
