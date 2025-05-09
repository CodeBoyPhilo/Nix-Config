{ pkgs, ... }:
{
  imports = [
    ./browsers
    ./mail
		./orbstack
    ./raycast
    ./reader
    ./sync
  ];

  environment.systemPackages = with pkgs; [ ];
}
