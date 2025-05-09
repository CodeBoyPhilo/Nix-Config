{ config, pkgs, ... }:

{

  home.file = {
    ".config/sketchybar" = {
      source = ./sketchybar;
			recursive = true;
    };
  };

}
