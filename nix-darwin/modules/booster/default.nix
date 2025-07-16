{ pkgs, ... }:
{
  imports = [
    ./1password
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
