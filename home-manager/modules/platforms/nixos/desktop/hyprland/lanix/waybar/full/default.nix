{ config, pkgs, ... }:
let
  black = "#11111b";
in
{
  home.file = {
    ".config/waybar/config" = {
      source = ./config;
    };
  };
  programs.waybar = {
    enable = true;
    style = with config.lib.stylix.colors.withHashtag; ''
      * {
      	border: none;
      	border-radius: 0px;
      	font-family: "Maple Mono NF CN";
      	font-size: 17px;
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

      #custom-music,
      #disk,
      #memory,
      #cpu,
      #clock,
      #custom-gpu,
      #custom-blueman {
      	background-color: ${black};
      	padding: 0.4rem 0.6rem;
      	margin: 5px 0;
      }

      #custom-music {
      	color: ${base0A};
      	border-radius: 0px 0px 0px 0px;
      }

      #disk {
      	color: ${base08};
      	border-radius: 0px 1rem 1rem 0px;
      	margin-right: 1rem;
      }

      #memory {
      	color: ${base07};
      }

      #cpu {
      	color: ${base07};
      	border-radius: 0px 0px 0px 0px;
      }

      #clock {
      	color: ${base07};
      	border-radius: 1rem 1rem 1rem 1rem;
      	margin-right: 1rem;
      }

      #custom-blueman {
      	color: ${base09};
      	border-radius: 1rem 0px 0px 1rem;
      	background-color: ${black};
      	margin-left: 1rem;
      }

      #custom-gpu {
      	color: ${base07};
      	border-radius: 1rem 1rem 1rem 1rem;
      	background-color: ${black};
      	margin-right: 1rem;
      }
    '';
  };
}
