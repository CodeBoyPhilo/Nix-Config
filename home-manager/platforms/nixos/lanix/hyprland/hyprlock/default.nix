{
  config,
  hostname,
  lib,
  pkgs,
  inputs,
  ...
}:
let
  monitor = "HDMI-A-3";
  bg = "/home/phil_oh/Pictures/Wallpapers/nature.png";
  fg = "/home/phil_oh/Pictures/Wallpapers/nature-no-bg.png";
  stylix-colors = config.lib.stylix.colors;
  hex2rgb = inputs.nix-colors.lib.conversions.hexToRGBString;

in
{
  home.packages = with pkgs; [
    hyprlock
    hypridle
  ];

  programs = {
    hyprlock = {
      enable = true;
      settings = {
        general = {
          disable_loading_bar = true;
          grace = 0;
          hide_cursor = true;
          no_fade_in = true;
          no_fade_out = true;
        };
        background = [
          {
            path = bg;
          }
          {
            path = fg;
            zindex = 1;
            keep_aspect_ratio = true;
            rounding = 0;
            border_size = 0;
          }
        ];
        image = [
          {
            # Avatar
            monitor = monitor;
            path = "$HOME/.face";
            border_size = 0;
            border_color = ''rgba(0, 0, 0, 0)'';
            size = 80;
            rounding = -1;
            rotate = 0;
            reload_time = -1;
            position = "0, -620";
            halign = "center";
            valign = "center";
            zindex = 1;
          }
        ];
        label = [
          {
            # Time
            monitor = monitor;
            text = ''cmd[update:1000] echo -e "$(date +"%H:%M")"'';
            color = ''rgba(${hex2rgb "," stylix-colors.base05}, 1)'';
            font_size = 380;
            font_family = "Adwaita Sans, Bold";
            position = "150, 500";
            halign = "center";
            valign = "center";
          }
        ];
        # Password
        input-field = [
          {
            monitor = monitor;
            size = "250, 60";
            position = "0, -700";
            outline_thickness = 2;
            dots_size = 0.15;
            dots_spacing = 0.35;
            dots_center = true;
            fade_on_empty = false;
            placeholder_text = ''<span foreground="##${stylix-colors.base05}">Enter Password...</span>'';
            fail_text = ''<span foreground="##${stylix-colors.base0E}">󰀧</span>  <i>$FAIL</i> <span foreground="##${stylix-colors.base0E}"><b>($ATTEMPTS)</b></span>'';
            fail_timeout = 3000; # milliseconds before fail_text and fail_color disappears
            fail_transition = 500; # transition time in ms between normal outer_color and fail_color
            hide_input = false;
            halign = "center";
            valign = "center";
            rounding = 8;
            font_family = "Adwaita Sans, Italic";
            outer_color = ''rgba(0, 0, 0, 0)'';
            inner_color = ''rgba(0, 0, 0, 0)'';
            font_color = ''rgba(${hex2rgb "," stylix-colors.base05}, 1.0)'';
            capslock_color = ''rgba(${hex2rgb "," stylix-colors.base0D}, 1.0)'';
            check_color = ''rgba(${hex2rgb "," stylix-colors.base03}, 1.0)'';
            fail_color = ''rgba(${hex2rgb "," stylix-colors.base0E}, 1.0)'';
            zindex = 1;
          }
        ];
      };
    };
  };
  services = {
    hypridle = {
      enable = true;
      settings = {
        general = {
          lock_cmd = "${lib.getExe pkgs.hyprlock}";
          before_sleep_cmd = "${lib.getExe pkgs.hyprlock}";
        };
        listener = [
          {
            timeout = 3600;
            on-timeout = "${lib.getExe pkgs.hyprlock}";
          }
          {
            timeout = 5400;
            on-timeout = "hyprctl dispatch dpms off";
            on-resume = "hyprctl dispatch dpms on";
          }
        ];
      };
    };
  };
  wayland.windowManager.hyprland = {
    settings = {
      bind = [
        "$SUPER, l, exec, ${lib.getExe pkgs.hyprlock} --immediate"
      ];
    };
  };
}
