{ config, pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.obsidian
  ];
}
