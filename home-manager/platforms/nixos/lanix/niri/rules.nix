{ config, pkgs, ... }:
{
  programs.niri.settings = {
    window-rules = [
      {
        draw-border-with-background = false;
        geometry-corner-radius = {
          bottom-left = 10.0;
          bottom-right = 10.0;
          top-left = 10.0;
          top-right = 10.0;
        };
        clip-to-geometry = true;
      }
      {
        matches = [
          {
            app-id = "firefox";
            title = "^Picture-in-Picture";
          }
        ];
        open-floating = true;
        default-floating-position = {
          x = 32;
          y = 32;
          relative-to = "bottom-right";
        };
        default-column-width = {
          fixed = 480;
        };
        default-window-height = {
          fixed = 270;
        };
      }
    ];
    layer-rules = [
      {
        matches = [ { namespace = "^swww-daemon"; } ];
        place-within-backdrop = true;
      }
    ];
  };
}
