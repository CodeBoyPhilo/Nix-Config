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
          "HDMI-A-3, /etc/wallpapers/A.png"
          "HDMI-A-4, /etc/wallpapers/A.png"
        ];
      };
    };
  };
}
