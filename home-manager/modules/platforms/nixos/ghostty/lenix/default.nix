{ config, pkgs, ... }:
let
  colors = config.lib.stylix.colors.withHashtag;
  prefix = "ctrl+a";
in
{
  home.packages = with pkgs; [
    ghostty
  ];

  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    clearDefaultKeybinds = true;
    settings = {
      font-family = "Maple Mono NF CN";
      font-size = 15;
      background-opacity = 0.8;
      background-blur = 64;
      theme = "custom";
      cursor-style = "block";
      cursor-style-blink = true;
      mouse-hide-while-typing = true;
			window-padding-x = 14;
			shell-integration-features = "sudo";
      keybind = [
        # Copy and Paste
        "ctrl+shift+c=copy_to_clipboard"
        "ctrl+shift+v=paste_from_clipboard"
        # Tab
        # "${prefix}>c=new_tab"
        # "${prefix}>one=goto_tab:1"
        # "${prefix}>two=goto_tab:2"
        # "${prefix}>three=goto_tab:3"
        # "${prefix}>four=goto_tab:4"
        # "${prefix}>five=goto_tab:5"
        # "${prefix}>n=next_tab"
        # "${prefix}>p=previous_tab"
        # "${prefix}>w=close_tab"
        # Zoom in / out
        "ctrl+shift+plus=increase_font_size:1"
        "ctrl+shift+minus=decrease_font_size:1"
        "ctrl+zero=reset_font_size"
        # Split
        # "${prefix}>h=new_split:right"
        # "${prefix}>v=new_split:down"
        # "${prefix}>m=toggle_split_zoom"
        # "ctrl+h=goto_split:left"
        # "ctrl+j=goto_split:down"
        # "ctrl+k=goto_split:up"
        # "ctrl+l=goto_split:right"
      ];
    };
    themes = {
      custom = {
        background = colors.base00;
        foreground = colors.base05;
        selection-background = colors.base0C;
        selection-foreground = colors.base00;
        cursor-color = colors.base0C;
        cursor-text = colors.base00;
        palette = [
          "0=${colors.base02}"
          "1=${colors.base0E}"
          "2=${colors.base08}"
          "3=${colors.base0D}"
          "4=${colors.base07}"
          "5=${colors.base0D}"
          "6=${colors.base0A}"
          "7=${colors.base05}"
          "8=${colors.base03}"
          "9=${colors.base0E}"
          "10=${colors.base08}"
          "11=${colors.base0D}"
          "12=${colors.base07}"
          "13=${colors.base0D}"
          "14=${colors.base0A}"
          "15=${colors.base05}"
        ];
      };
    };
  };
}
