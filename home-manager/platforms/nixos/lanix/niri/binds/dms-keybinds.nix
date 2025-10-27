{ config, pkgs, ... }:
{
  programs.niri.settings.binds =
    with config.lib.niri.actions;
    let
      dms-ipc = spawn "dms" "ipc";
    in
    {
      "Mod+Space" = {
        hotkey-overlay.title = "Toggle Application Launcher";
        action = dms-ipc "spotlight" "toggle";
      };
      "Mod+Comma" = {
        hotkey-overlay.title = "Toggle Settings";
        action = dms-ipc "settings" "toggle";
      };
      "Mod+N" = {
        hotkey-overlay.title = "Toggle Notepad";
        action = dms-ipc "notepad" "toggle";
      };
      "Super+L" = {
        hotkey-overlay.title = "Toggle Lock Screen";
        action = dms-ipc "lock" "lock";
      };
      "Mod+P" = {
        hotkey-overlay.title = "Toggle Power Menu";
        action = dms-ipc "powermenu" "toggle";
      };
      "Mod+M" = {
        hotkey-overlay.title = "Toggle Process List";
        action = dms-ipc "processlist" "toggle";
      };
      "Mod+V" = {
        hotkey-overlay.title = "Toggle Clipboard Manager";
        action = dms-ipc "clipboard" "toggle";
      };
      "XF86AudioRaiseVolume" = {
        allow-when-locked = true;
        action = dms-ipc "audio" "increment" "3";
      };
      "XF86AudioLowerVolume" = {
        allow-when-locked = true;
        action = dms-ipc "audio" "decrement" "3";
      };
      "XF86AudioMute" = {
        allow-when-locked = true;
        action = dms-ipc "audio" "mute";
      };
      "XF86AudioMicMute" = {
        allow-when-locked = true;
        action = dms-ipc "audio" "micmute";
      };
      "XF86AudioPlay" = {
        action = dms-ipc "mpris" "playPause";
      };
      "XF86AudioStop" = {
        action = dms-ipc "mpris" "playPause";
      };
      "XF86AudioPrev" = {
        action = dms-ipc "mpris" "previous";
      };
      "XF86AudioNext" = {
        action = dms-ipc "mpris" "next";
      };
      "XF86MonBrightnessUp" = {
        allow-when-locked = true;
        action = dms-ipc "brightness" "increment" "5" "";
      };
      "XF86MonBrightnessDown" = {
        allow-when-locked = true;
        action = dms-ipc "brightness" "decrement" "5" "";
      };
    };
}
