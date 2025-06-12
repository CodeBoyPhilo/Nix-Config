{ config, pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      bar = {
        layer = "top";
        position = "top";
        modules-left= [ "hyprland/workspaces" ];
        modules-center= [
          "clock"
          "custom/gpu"
        ];
        modules-right= [
          "custom/blueman"
          "custom/music"
          "memory"
          "cpu"
          "disk"
        ];

        "hyprland/workspaces" = {
          disable-scroll = true;
          sort-by-name = true;
          format = "{windows} ";
          format-window-separator = " ";
          window-rewrite-default = "";
          window-rewrite = {
            "class<kitty>" = " ";
            "class<kitty> title<.*nvim.*>" = " ";
            "class<neovide>" = " ";
            "class<firefox>" = " ";
            "class<obsidian>" = " ";
            "class<spotify>" = " ";
						"class<steam>" = " ";
            "title<.*Bluetooth.*>" = " ";
            "title<.*Zotero.*>" = "󱛉 ";
          };
        };
        "disk" = {
          interval = 10;
          format = " ";
          unit = "GB";
        };
        "memory" = {
          interval = 30;
          format = " ";
          tooltip-format = "{used:0.1f}G/{total:0.1f}G";
        };
        "custom/music" = {
          format = " ";
          escape = true;
          interval = 5;
          tooltip = true;
          tooltip-format = "{}";
          exec = ''playerctl metadata --format="{{ title }}"'';
          on-click = "playerctl play-pause";
          max-length = 50;
        };
        "clock" = {
          format = "  {:%a %d %H:%M}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        };
        "cpu" = {
          interval = 10;
          format = " ";
          max-length = 10;
        };
        "custom/blueman" = {
          format = " ";
          tooltip = false;
          escape = true;
          interval = 5;
          on-click = "blueman-manager";
        };
        "custom/gpu" = {
          "exec" = "nvidia-smi --query-gpu=utilization.gpu --format=csv,noheader,nounits";
          "format" = "󰢮 {}%";
          "return-type" = "";
          "interval" = 1;
        };
      };
    };
    style = with config.lib.stylix.colors.withHashtag; ''
                  * {
                    font-family: "Maple Mono NF CN";
                    font-size: 17px;
                    min-height: 0; 
                  }

                  #waybar {
                    background: transparent;
                    color: ${base05};
                    margin: 2px 2px;
                  }

                  #workspaces {
                    border-radius: 1rem;
                    margin: 5px;
                    background-color: ${base02};
                  }

                  #workspaces button {
                    color: ${base06};
                    border-radius: 1rem;
                    padding: 0.4rem 0.6rem;
                  }

                  #workspaces button.active {
                    color: ${base09};
                    border-radius: 1rem;
                  }

                  #workspaces button:hover {
                  	background: none;
                  	border: none;
                  }

                  #custom-music,
                  #disk,
                  #memory,
                  #cpu,
                  #clock,
									#custom-gpu,
            			#custom-blueman {
                    background-color: ${base02};
                    padding: 0.4rem 0.6rem;
                    margin: 5px 0;
                  }

                  #custom-music {
                    color: ${base0A};
      							border-radius: 0px 0px 0px 0px
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
                    color: ${base09};
                    border-radius: 1rem 1rem 1rem 1rem;
                    margin-right: 1rem;
                  }

                  #custom-blueman {
                    color: ${base09};
                    border-radius: 1rem 0px 0px 1rem;
                    background-color: ${base02};
                  }

									#custom-gpu {
										color: ${base08};
										border-radius: 1rem 1rem 1rem 1rem;
										background-color: ${base02};
									}

    '';
  };
}
