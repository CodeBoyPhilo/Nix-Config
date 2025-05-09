{ pkgs, ... }:
{
  imports = [
    ./microsoft-office
		./obsidian
		./tex
  ];

  environment.systemPackages = with pkgs; [ ];
}

