{
  config,
  pkgs,
  lib,
  ...
}:
{
  home.packages = with pkgs; [
    swww
  ];
}
