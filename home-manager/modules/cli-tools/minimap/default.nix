{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    code-minimap
  ];
}
