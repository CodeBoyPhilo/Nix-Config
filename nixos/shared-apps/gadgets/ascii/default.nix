{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    peaclock
		asciiquarium-transparent
  ];
}
