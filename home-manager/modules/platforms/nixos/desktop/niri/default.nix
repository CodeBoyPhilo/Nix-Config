{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    swww
    xwayland-satellite
  ];
  imports = [
    ./binds
    ./input.nix
    ./layout.nix
    ./misc.nix
    ./outputs.nix
    ./rules.nix
    ./spawns.nix
  ];
  programs.niri.enable = true;
}
