{ pkgs, ... }:
{
  imports = [
    ./1password
		./betterdisplay
    ./browsers
    ./display-link
		./ghostty
    ./mail
		./media
    ./orbstack
    ./raycast
    ./reader
    ./sync
		./zoom
  ];

  environment.systemPackages = with pkgs; [ ];
}
