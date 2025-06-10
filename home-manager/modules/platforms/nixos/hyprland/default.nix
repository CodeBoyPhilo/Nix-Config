{
  config,
  lib,
  pkgs,
  ...
}:
let
  stylix-colors = config.lib.stylix.colors;
in
{
  imports = [
    ./hyprlock
    ./hyprshot
    ./rofi
    ./swaync
    ./swww
    ./waybar
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.variables = [ "--all" ];
    package = null;
    portalPackage = null;
    settings = {
      "$mainMod" = "ALT";
      "$terminal" = "kitty";
      "$fileManager" = "dolphin";
      monitor = "HDMI-A-3,preferred,auto,1";
      workspace = "3,monitor:HDMI-A-3,default:true";
      exec-once = [
        "waybar"
        "swaync"
        "hypridle"
        "swww-daemon"
        "swww img /home/phil_oh/Pictures/wallpapers/Nature.png"
        "fcitx5"
        "[workspace 1 silent] kitty"
        "[workspace 2 silent] firefox"
        "[workspace 10 silent] spotify"
      ];
      input = {
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = 0;
      };
      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;
        "col.active_border" = "rgb(${stylix-colors.base09})"; # lavender
        "col.inactive_border" = "rgb(${stylix-colors.base03})"; # base
        layout = "dwindle";
        allow_tearing = false;
      };
      decoration = {
        rounding = 10;
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
        };
      };
      animations = {
        enabled = true;
        bezier = "myBezier, 0.05, 0.9, 0.1, 1.05";
        animation = [
          "windows, 1, 5, myBezier"
          "windowsOut, 1, 5, default, popin 80%"
          "border, 1, 8, default"
          "borderangle, 1, 5, default"
          "fade, 1, 5, default"
          "workspaces, 1, 5, default"
        ];
      };
      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
      misc = {
        force_default_wallpaper = -1;
      };
      device = {
        name = "epic-mouse-v1";
        sensitivity = -0.5;
      };
      xwayland = {
        force_zero_scaling = true;
      };
      windowrulev2 = [
        "suppressevent maximize, class:.*"
      ];
      bind = [
        "$mainMod, T, exec, $terminal"
        "$mainMod, Q, killactive,"
        "$mainMod SHIFT, Q, exit,"
        "$mainMod, E, exec, $fileManager"
        "$mainMod, V, togglefloating," # TODO: change this
        "$mainMod, space, exec, pkill rofi || true && rofi -show drun -modi drun,filebrowser,run,window "
        "$mainMod, P, pseudo,"
        "$mainMod, S, togglesplit,"

        "$mainMod, f, fullscreen,1"
        "$mainMod SHIFT, f, fullscreen,0"

        "$mainMod, h, movefocus, l"
        "$mainMod, j, movefocus, d"
        "$mainMod, k, movefocus, u"
        "$mainMod, l, movefocus, r"

        "$mainMod SHIFT, h, movewindow, l"
        "$mainMod SHIFT, j, movewindow, d"
        "$mainMod SHIFT, k, movewindow, u"
        "$mainMod SHIFT, l, movewindow, r"

        "$mainMod, 1, workspace, 1"
        "$mainMod, 2, workspace, 2"
        "$mainMod, 3, workspace, 3"
        "$mainMod, 4, workspace, 4"
        "$mainMod, 5, workspace, 5"
        "$mainMod, 6, workspace, 6"
        "$mainMod, 7, workspace, 7"
        "$mainMod, 8, workspace, 8"
        "$mainMod, 9, workspace, 9"
        "$mainMod, 0, workspace, 10"

        "$mainMod SHIFT, 1, movetoworkspace, 1"
        "$mainMod SHIFT, 2, movetoworkspace, 2"
        "$mainMod SHIFT, 3, movetoworkspace, 3"
        "$mainMod SHIFT, 4, movetoworkspace, 4"
        "$mainMod SHIFT, 5, movetoworkspace, 5"
        "$mainMod SHIFT, 6, movetoworkspace, 6"
        "$mainMod SHIFT, 7, movetoworkspace, 7"
        "$mainMod SHIFT, 8, movetoworkspace, 8"
        "$mainMod SHIFT, 9, movetoworkspace, 9"
        "$mainMod SHIFT, 0, movetoworkspace, 10"

        "$mainMod, M, togglespecialworkspace, magic"
        "$mainMod SHIFT, M, movetoworkspace, special:magic"

        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

				", XF86AudioRaiseVolume, exec, playerctl volume 0.05+"
				", XF86AudioLowerVolume, exec, playerctl volume 0.05-"
				", XF86AudioNext, exec, playerctl next"
				", XF86AudioPrev, exec, playerctl previous"
				", XF86AudioPlay, exec, playerctl play-pause"
      ];
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
