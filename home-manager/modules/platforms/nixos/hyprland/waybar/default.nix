{ config, pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      bar = {
        layer = "top";
        position = "top";
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "custom/music" ];
        modules-right = [
          "disk"
          "memory"
          "cpu"
          "clock"
        ];

        "hyprland/workspaces" = {
          disable-scroll = true;
          sort-by-name = true;
          format = " {icon} ";
          format-icons = {
            default = "";
          };
        };
        "disk" = {
          interval = 30;
          format = "{used} / {total}";
          unit = "GB";
        };
        "memory" = {
          interval = 30;
          format = "{used:0.1f}G/{total:0.1f}G ";
        };
        "custom/music" = {
          format = "  {}";
          escape = true;
          interval = 5;
          tooltip = false;
          exec = ''playerctl metadata --format="{{ title }}"'';
          on-click = "playerctl play-pause";
          max-length = 50;
        };
        "clock" = {
          format = "  {:%a %d %H:%M}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };
        "cpu" = {
          interval = 10;
          format = "{}% ";
          max-length = 10;
        };
      };
    };
    style = with config.lib.stylix.colors.withHashtag; ''
      * {
        font-family: "Maple Mono NF CN";
        font-size: 17px;
        min-height: 0; 
      }

      #waybar {
        background: transparent;
        color: ${base05};
        margin: 2px 2px;
      }

      #workspaces {
        border-radius: 1rem;
        margin: 5px;
        background-color: ${base02};
        margin-left: 1rem;
      }

      #workspaces button {
        color: ${base06};
        border-radius: 1rem;
        padding: 0.4rem;
      }

      #workspaces button.active {
        color: ${base09};
        border-radius: 1rem;
      }

      #workspaces button:hover {
      	background: none;
      	border: none;
      }

      #custom-music,
      #clock,
      #cpu,
      #memory,
      #disk,
      #custom-power {
        background-color: ${base02};
        padding: 0.5rem 1rem;
        margin: 5px 0;
      }

      #clock {
        color: ${base09};
        border-radius: 0px 1rem 1rem 0px;
        margin-right: 1rem;
      }

      #battery {
        color: ${base0B};
      }

      #battery.charging {
        color: ${base0B};
      }

      #battery.warning:not(.charging) {
        color: ${base0E};
      }

      #cpu {
        color: ${base07};
      }

      #memory {
        color: ${base07};
      }

      #backlight, #battery {
          border-radius: 0;
      }

      #disk {
        color: ${base06};
        border-radius: 1rem 0px 0px 1rem;
        margin-left: 1rem;
      }

      #custom-music {
        color: ${base0F};
        border-radius: 1rem;
      }

      #custom-lock {
          border-radius: 1rem 0px 0px 1rem;
          color: ${base06};
      }

      #custom-power {
          margin-right: 1rem;
          border-radius: 0px 1rem 1rem 0px;
          color: ${base0E};
      }

      #tray {
        margin-right: 1rem;
        border-radius: 1rem;
      }
    '';
  };
}

# { config, pkgs, ... }:
# {
#   home.packages = with pkgs; [
#     waybar
#   ];
#   home = {
#     file."${config.xdg.configHome}/waybar/config.jsonc".source = ./waybar/config.jsonc;
#     file."${config.xdg.configHome}/waybar/mocha.css".source = ./waybar/mocha.css;
#     file."${config.xdg.configHome}/waybar/style.css".source = ./waybar/style.css;
#   };
#   programs.waybar.enable = true;
# }
