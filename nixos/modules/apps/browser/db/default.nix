{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    sqlitebrowser
  ];
}
