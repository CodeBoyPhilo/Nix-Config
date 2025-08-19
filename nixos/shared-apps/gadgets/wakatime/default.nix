{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wakatime-cli
  ];
}
