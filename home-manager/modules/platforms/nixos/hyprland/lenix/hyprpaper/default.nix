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
          ", /etc/wallpapers/A.png"
        ];
      };
    };
  };
}
