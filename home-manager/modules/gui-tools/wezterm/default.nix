{ config, pkgs, ... }:

{

  home.packages = with pkgs; [
    wezterm
  ];

  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    extraConfig = ''
            local wezterm = require("wezterm")

            local config = {}

            local act = wezterm.action

            config.font = wezterm.font_with_fallback({
            	{ family = "Maple Mono NF CN" }, 
      				{ family = "SF Pro"}
            })
            config.font_size = 19
            
      			-- config.color_scheme = "Catppuccin Mocha"
            config.color_scheme = "tokyonight_night"

            config.enable_tab_bar = false

            config.window_decorations = "RESIZE"
            config.mouse_bindings = {
            	{
            		event = { Down = { streak = 1, button = { WheelUp = 1 } } },
            		mods = "NONE",
            		action = act.ScrollByCurrentEventWheelDelta,
            	},
            	{
            		event = { Down = { streak = 1, button = { WheelDown = 1 } } },
            		mods = "NONE",
            		action = act.ScrollByCurrentEventWheelDelta,
            	},
            }
            return config
            		'';
  };

}
