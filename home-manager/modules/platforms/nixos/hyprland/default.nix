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
    ./hyprpaper
    ./hyprshot
    ./rofi
    ./swaync
    # ./swww
    ./waybar
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.variables = [ "--all" ];
    package = null;
    portalPackage = null;
    settings = {
      "$mainMod" = "ALT";
      "$terminal" = "ghostty";
      "$fileManager" = "dolphin";
      monitor = [
        "HDMI-A-3,preferred,0x0,1"
        "HDMI-A-4,preferred,-1620x-470,0.67,transform,1"
      ];
      workspace = [
        "1,monitor:HDMI-A-3"
        "2,monitor:HDMI-A-3"
        "3,monitor:HDMI-A-3,default:true"
        "4,monitor:HDMI-A-3"
        "5,monitor:HDMI-A-4"
        "6,monitor:HDMI-A-4"
        "7,monitor:HDMI-A-4"
        "8,monitor:HDMI-A-3"
        "9,monitor:HDMI-A-3"
        "10,monitor:HDMI-A-3"
      ];
      exec-once = [
        "waybar"
        "swaync"
        "hypridle"
        "hyprpaper"
        # "swww-daemon"
        # "swww img /home/phil_oh/Pictures/wallpapers/A.png"
        "fcitx5"
        "[workspace 1 silent] ghostty"
        "[workspace 2 silent] firefox"
        "[workspace 8 silent] wechat-uos"
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
        "col.active_border" = "rgb(${stylix-colors.base07})"; # blue
        "col.inactive_border" = "rgb(${stylix-colors.base00})"; # base
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
        bezier = [
          "wind, 0.05, 0.9, 0.1, 1.05"
          "winIn, 0.1, 1.1, 0.1, 1.1"
          "winOut, 0.3, -0.3, 0, 1"
          "liner, 1, 1, 1, 1"
          "md3_standard, 0.2, 0, 0, 1"
          "md3_decel, 0.05, 0.7, 0.1, 1"
          "md3_accel, 0.3, 0, 0.8, 0.15"
          "overshot, 0.05, 0.9, 0.1, 1.1"
          "crazyshot, 0.1, 1.5, 0.76, 0.92 "
          "hyprnostretch, 0.05, 0.9, 0.1, 1.0"
          "menu_decel, 0.1, 1, 0, 1"
          "menu_accel, 0.38, 0.04, 1, 0.07"
          "easeInOutCirc, 0.85, 0, 0.15, 1"
          "easeOutCirc, 0, 0.55, 0.45, 1"
          "easeOutExpo, 0.16, 1, 0.3, 1"
          "softAcDecel, 0.26, 0.26, 0.15, 1"
          "md2, 0.4, 0, 0.2, 1"
        ];
        animation = [
          "border, 1, 1, liner"
          "borderangle, 1, 30, liner, loop"
          "windows, 1, 6, wind, slide"
          "windowsIn, 1, 6, winIn, slide"
          "windowsOut, 1, 5, winOut, slide"
          "windowsMove, 1, 5, wind, slide"
          "fade, 1, 3, md3_decel"
          "layersIn, 1, 3, menu_decel, slide"
          "layersOut, 1, 1.6, menu_accel"
          "fadeLayersIn, 1, 2, menu_decel"
          "fadeLayersOut, 1, 4.5, menu_accel"
          "workspaces, 1, 7, menu_decel, slide"
          "workspaces, 1, 5, wind"
          "specialWorkspace, 1, 3, md3_decel, slidefadevert 15%"
          "specialWorkspace, 1, 3, md3_decel, slidevert"
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
        "workspace special:editor, class:^(neovide)$"
        "workspace special:obsidian, class:^(obsidian)$"
      ];
      bind = [
        "$mainMod, T, exec, $terminal"
        "$mainMod, Q, killactive,"
        "$mainMod SHIFT CTRL, Q, exit,"
        # "$mainMod, E, exec, neovide-with-avante"
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

        "$mainMod, E, togglespecialworkspace, editor"
        "$mainMod SHIFT, E, exec, neovide-with-avante"
        "$mainMod, O, togglespecialworkspace, obsidian"
        "$mainMod SHIFT, O, exec, obsidian"

        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_SINK@ 0.05+"
        ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_SINK@ 0.05-"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioStop, exec, playerctl play-pause"
        ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_SINK@ toggle"
      ];
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
