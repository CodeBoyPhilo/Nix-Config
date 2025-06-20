{ pkgs, ... }:
{
  imports = [
    ./microsoft-office
		./obsidian
  ];

  environment.systemPackages = with pkgs; [ ];
}

