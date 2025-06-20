{ pkgs, ... }:
{
  imports = [
    ./browsers
		./display-link
    ./mail
		./orbstack
    ./raycast
    ./reader
    ./sync
  ];

  environment.systemPackages = with pkgs; [ ];
}
