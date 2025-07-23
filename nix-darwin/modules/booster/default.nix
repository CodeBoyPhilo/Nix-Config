{ pkgs, ... }:
{
  imports = [
    ./1password
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
