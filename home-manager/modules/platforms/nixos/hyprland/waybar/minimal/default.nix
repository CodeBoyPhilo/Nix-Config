{ config, pkgs, ... }:
let
  black = "#11111b";
in
{
  programs.waybar = {
    enable = true;
    settings = {
      bar = {
        position = "top";
        layer = "top";
        modules-center = [
          "hyprland/workspaces"
        ];
        "hyprland/workspaces" = {
          active-only = false;
          all-outputs = false;
          disable-scroll = false;
          on-scroll-up = "hyprctl dispatch workspace e-1";
          on-scroll-down = "hyprctl dispatch workspace e+1";
          format = "{icon} {windows}";
          on-click = "activate";
          format-icons = {
            "urgent" = "";
            "active" = "";
            "default" = "";
          };
          sort-by-number = true;
          window-rewrite = {
            "class<com.mitchellh.ghostty>" = "󰊠 ";
            "class<neovide>" = " ";
            "class<firefox>" = " ";
            "class<obsidian>" = " ";
            "class<spotify>" = " ";
            "class<steam>" = " ";
            "class<wechat>" = " ";
            "title<.*Bluetooth.*>" = " ";
            "title<.*Zotero.*>" = "󱛉 ";
            "title<.*nvim.*>" = " ";
          };
          window-rewrite-default = " ";
        };
      };
    };
    style = with config.lib.stylix.colors.withHashtag; ''
      * {
      	border: none;
      	border-radius: 0px;
      	font-family: "Maple Mono NF CN";
      	font-size: 15px;
      	font-weight: bold;
      	min-height: 0; 
      }

      window#waybar {
      	background: transparent;
      	color: ${black};
      	margin: 2px 2px;
      }

      #workspaces {
      	background: ${black};
      	margin: 5px 5px;
      	padding: 8px 5px;
      	border-radius: 16px;
      	border: solid 0px ${base05};
      	font-weight: bold;
      	font-style: normal;
      }

      #workspaces button {
      	padding: 0px 5px;
      	margin: 0px 3px;
      	border-radius: 16px;
      	color: ${base02};
      	background-color: ${base02};
      	transition: all 0.3s ease-in-out;
      }

      #workspaces button.active {
      	color: ${black};
      	background-color: ${base07};
      	border-radius: 16px;
      	min-width: 50px;
      	background-size: 400% 400%;
      	transition: all 0.3s ease-in-out;
      }

      #workspaces button:hover {
      	background-color: ${base07};
      	color: ${base07};
      	border-radius: 16px;
        min-width: 50px;
        background-size: 400% 400%;
      }

    '';
  };
}
