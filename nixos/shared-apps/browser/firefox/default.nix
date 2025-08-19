{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    firefox
  ];

  programs.firefox.enable = true;
}
