{
  config,
  lib,
  pkgs,
  my-nixvim-config,
  nixvimSpecialArgs,
  inputs,
  platform,
  ...
}:

{
  home.packages = with pkgs; [
    lsof
    my-nixvim-config.packages.${platform}.default
  ];
}
