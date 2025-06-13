{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    skimpdf
  ];
}
