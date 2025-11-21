{ config, pkgs, ... }:
{
  imports = [ ./dms-keybinds.nix ];
  programs.niri.settings.binds = with config.lib.niri.actions; {
    "Mod+Shift+Slash" = {
      hotkey-overlay.title = "Show Hotkey Overlay";
      action = show-hotkey-overlay;
    };
    "Mod+Ctrl+Shift+Q" = {
      hotkey-overlay.title = "Quit Niri";
      action = quit { skip-confirmation = true; };
    };
    "Mod+O" = {
      hotkey-overlay.title = "Toggle Overview";
      action = toggle-overview;
      repeat = false;
    };
    "Mod+Q" = {
      hotkey-overlay.title = "Close Window";
      action = close-window;
      repeat = false;
    };
    # "Mod+Ctrl+3" = {
    #   hotkey-overlay.title = "Capture Window";
    #   action = screenshot-window;
    # };
    # "Mod+Ctrl+4" = {
    #   hotkey-overlay.title = "Capture Region";
    #   action = screenshot { show-pointer = false; };
    # };

    "Mod+G".action = toggle-column-tabbed-display;

    "Mod+H".action = focus-column-left;
    "Mod+J".action = focus-window-or-workspace-down;
    "Mod+K".action = focus-window-or-workspace-up;
    "Mod+L".action = focus-column-right;
    "Mod+Shift+H".action = consume-or-expel-window-left;
    "Mod+Shift+J".action = move-window-down-or-to-workspace-down;
    "Mod+Shift+K".action = move-window-up-or-to-workspace-up;
    "Mod+Shift+L".action = consume-or-expel-window-right;

    "Mod+Left".action = focus-monitor-left;
    "Mod+Down".action = focus-monitor-down;
    "Mod+Up".action = focus-monitor-up;
    "Mod+Right".action = focus-monitor-right;
    "Mod+Shift+Left".action = move-window-to-monitor-left;
    "Mod+Shift+Down".action = move-window-to-monitor-down;
    "Mod+Shift+Up".action = move-window-to-monitor-up;
    "Mod+Shift+Right".action = move-window-to-monitor-right;

    "Mod+Ctrl+J".action = move-workspace-down;
    "Mod+Ctrl+K".action = move-workspace-up;

    "Mod+R".action = switch-preset-column-width;
    "Mod+F".action = maximize-column;
    "Mod+Shift+F".action = fullscreen-window;
    "Mod+C".action = center-column;
    "Super+Left".action = set-column-width "-10%";
    "Super+Down".action = set-window-height "-10%";
    "Super+Up".action = set-window-height "+10%";
    "Super+Right".action = set-column-width "+10%";
    "Mod+1".action = focus-workspace 1;
    "Mod+2".action = focus-workspace 2;
    "Mod+3".action = focus-workspace 3;
    "Mod+4".action = focus-workspace 4;
    "Mod+5".action = focus-workspace 5;
    "Mod+6".action = focus-workspace 6;
    "Mod+7".action = focus-workspace 7;
    "Mod+8".action = focus-workspace 8;
    "Mod+9".action = focus-workspace 9;

    "Mod+T" = {
      hotkey-overlay.title = "Open a Terminal: ghostty";
      action = spawn "ghostty";
    };
    "Mod+E" = {
      hotkey-overlay.title = "Open Editor: Neovide";
      action = spawn "neovide-with-avante";
    };
  };
}
