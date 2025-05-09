{ pkgs, ... }:
{
  imports = [
    ./sketchybar
		./wallpaper
  ];

  environment.systemPackages = with pkgs; [ ];
}

