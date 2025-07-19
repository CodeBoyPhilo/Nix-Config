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
  ];

  environment.systemPackages = with pkgs; [ ];
}
