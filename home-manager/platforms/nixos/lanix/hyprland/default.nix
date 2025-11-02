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
    # ./hyprpaper
    ./hyprshot
    # ./rofi
    # ./swaync
    # ./swww
    # ./waybar
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.variables = [ "--all" ];
    # package = null;
    # portalPackage = null;
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
        # "waybar"
        # "swaync"
        "hypridle"
        "hyprpaper"
        # "swww-daemon"
        # "swww img /home/phil_oh/Pictures/wallpapers/A.png"
        "fcitx5"
        "wl-paste --watch cliphist store &"
        "[workspace 1 silent] ghostty"
        "[workspace 2 silent] firefox"
        # "[workspace 8 silent] wechat"
        "[workspace 10 silent] tidal-hifi"
      ];
      # exec = [
      #   "hyprctl dispatch submap global"
      # ];
      # submap = "global";
      input = {
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = 0;
        repeat_rate = 40;
        repeat_delay = 300;
        mouse_refocus = false;
      };
      general = {
        gaps_in = 5;
        gaps_out = 20;
        border_size = 0;
        "col.active_border" = "rgb(${stylix-colors.base00})"; # base
        "col.inactive_border" = "rgb(${stylix-colors.base00})"; # base
        layout = "dwindle";
        allow_tearing = false;
      };
      group = {
        "col.border_active" = "rgb(${stylix-colors.base07})"; # blue
        "col.border_inactive" = "rgb(${stylix-colors.base00})"; # base
        groupbar = {
          render_titles = false;
          "col.active" = "rgb(${stylix-colors.base07})"; # blue
          "col.inactive" = "rgb(${stylix-colors.base00})"; # base
        };
      };
      decoration = {
        rounding = 10;
        blur = {
          enabled = false;
          size = 3;
          passes = 1;
        };
        dim_inactive = true;
        dim_strength = 0.2;
        # dim_around = 0.4;
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
        "nodim, class:^(firefox)"
        # "dimaround, class:^(ghostty)"
        # "workspace special:editor, class:^(neovide)$"
        # "workspace special:obsidian, class:^(obsidian)$"
        # "workspace special:btop, title:^(btop)$"
      ];
      bind = [
        # DMS keybinds
        "$mainMod, space, exec, dms ipc call spotlight toggle"
        "$mainMod SHIFT, V, exec, dms ipc call clipboard toggle"
        "$mainMod, comma, exec, dms ipc call settings toggle"
        "$mainMod SHIFT, N, exec, dms ipc call notepad toggle"
        "$SUPER, L, exec, dms ipc call lock lock"
        "$mainMod SHIFT, P, exec, dms ipc call powermenu toggle"
        "$mainMod, C, exec, dms ipc call control-center toggle"
        ", XF86AudioRaiseVolume, exec, dms ipc call audio increment 3"
        ", XF86AudioLowerVolume, exec, dms ipc call audio decrement 3"
        ", XF86AudioNext, exec, dms ipc call mpris next"
        ", XF86AudioPrev, exec, dms ipc call mpris previous"
        ", XF86AudioPlay, exec, dms ipc call mpris playPause"
        ", XF86AudioStop, exec, dms ipc call mpris playPause"
        ", XF86AudioMute, exec, dms ipc call audio mute"

        "$mainMod, T, exec, $terminal"
        "$mainMod, Q, killactive,"
        "$mainMod SHIFT CTRL, Q, exit,"
        # "$mainMod, E, exec, neovide-with-avante"
        "$mainMod, V, togglefloating," # TODO: change this
        # "$mainMod, space, global, caelestia:launcher"
        "$mainMod, P, pseudo,"
        "$mainMod, S, togglesplit,"

        "$mainMod, f, fullscreen,1"
        "$mainMod SHIFT, f, fullscreen,0"

        "$mainMod, h, movefocus, l"
        "$mainMod, j, movefocus, d"
        "$mainMod, k, movefocus, u"
        "$mainMod, l, movefocus, r"
        # "$mainMod SHIFT, h, swapwindow, l"
        # "$mainMod SHIFT, j, swapwindow, d"
        # "$mainMod SHIFT, k, swapwindow, u"
        # "$mainMod SHIFT, l, swapwindow, r"

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
        # "$mainMod SHIFT, E, exec, [workspace special:editor] neovide-with-avante"
        "$mainMod SHIFT, E, movetoworkspace, special:editor"
        "$mainMod, O, togglespecialworkspace, obsidian"
        "$mainMod SHIFT, O, exec, [workspace special:obsidian] obsidian"
        "$mainMod, M, togglespecialworkspace, btop"
        "$mainMod SHIFT, M, exec, [workspace special:btop] ghostty --title=btop -e btop"
        "$mainMod, Z, togglespecialworkspace, zotero"
        "$mainMod SHIFT, Z, exec, [workspace special:zotero] zotero"

        "$mainMod, G, togglegroup"
        "$mainMod SHIFT, h, movewindoworgroup, l"
        "$mainMod SHIFT, j, movewindoworgroup, d"
        "$mainMod SHIFT, k, movewindoworgroup, u"
        "$mainMod SHIFT, l, movewindoworgroup, r"
        "$mainMod, B, changegroupactive, b"
        "$mainMod, N, changegroupactive, f"

        "$mainMod, mouse_down, workspace, e+1"
        "$mainMod, mouse_up, workspace, e-1"

        # ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_SINK@ 0.05+"
        # ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_SINK@ 0.05-"
        # ", XF86AudioNext, exec, playerctl next"
        # ", XF86AudioPrev, exec, playerctl previous"
        # ", XF86AudioPlay, exec, playerctl play-pause"
        # ", XF86AudioStop, exec, playerctl play-pause"
        # ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_SINK@ toggle"
      ];
      bindm = [
        "$mainMod, mouse:272, movewindow"
        "$mainMod, mouse:273, resizewindow"
      ];
    };
  };
}
