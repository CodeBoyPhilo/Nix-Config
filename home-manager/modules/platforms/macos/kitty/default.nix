{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    kitty
  ];

  programs.kitty = {
    enable = true;
    font = {
      name = "Maple Mono NF CN";
      size = 18;
    };
    settings = {
      background_opacity = 0.4;
      background_blur = 64;
    };
    shellIntegration.enableZshIntegration = true;
    extraConfig = with config.lib.stylix.colors.withHashtag; ''
            # vim:ft=kitty

            # The basic colors
            foreground              ${base05}
            background              ${base00}
            selection_foreground    ${base00}
            selection_background    ${base0C}

            # Cursor colors
            cursor                  ${base0C}
            cursor_text_color       ${base00}

            # URL underline color when hovering with mouse
            url_color               ${base0C}

            # Kitty window border colors
            active_border_color     ${base06}
            inactive_border_color   ${base04}
            bell_border_color       ${base0D}

            # OS Window titlebar colors
            wayland_titlebar_color system
            macos_titlebar_color system

            # Tab bar colors
            active_tab_foreground   ${base00}
            active_tab_background   ${base0F}
            inactive_tab_foreground ${base05}
            inactive_tab_background ${base01}
            tab_bar_background      ${base00}

            # Colors for marks (marked text in the terminal)
            mark1_foreground ${base00}
            mark1_background ${base06}
            mark2_foreground ${base00}
            mark2_background ${base0F}
            mark3_foreground ${base00}
            mark3_background ${base08}

            # The 16 terminal colors

            # black
            # color0 ${base03}
            # color8 ${base04}
      			color0 ${base01}
      			color8 ${base00}

            # red
            color1 ${base0E}
            color9 ${base0E}

            # green
            # color2  ${base0B}
            # color10 ${base0B}

      			# sapphire
      			color2 ${base08}
      			color10 ${base08}
       
            # yellow
            color3  ${base0D}
            color11 ${base0D}

            # blue
            color4  ${base07}
            color12 ${base07}

            # magenta
            color5  ${base0D}
            color13 ${base0D}

            # cyan
            color6  ${base0A}
            color14 ${base0A}

            # white
            color7  ${base05} 
            color15 ${base05} 
            		'';
  };
}
