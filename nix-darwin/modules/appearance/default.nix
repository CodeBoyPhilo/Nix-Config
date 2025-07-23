{ pkgs, ... }:
{
  imports = [
		./wallpaper
  ];

  environment.systemPackages = with pkgs; [ ];
}

