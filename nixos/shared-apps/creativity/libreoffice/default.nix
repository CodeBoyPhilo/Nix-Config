{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    libreoffice-qt6-fresh
  ];
}
