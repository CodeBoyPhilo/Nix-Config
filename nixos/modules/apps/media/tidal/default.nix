{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    tidal-hifi
  ];

}
