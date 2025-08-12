{ pkgs, ... }:
{
  imports = [
    ./1password
		./betterdisplay
    ./browsers
    ./display-link
		./ghostty
    ./mail
    ./orbstack
    ./raycast
    ./reader
    ./sync
		./zoom
  ];

  environment.systemPackages = with pkgs; [ ];
}
