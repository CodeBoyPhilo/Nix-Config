{
  config,
  pkgs,
  inputs,
  ...
}:
{
  home.packages = with pkgs; [
    swww
    xwayland-satellite
  ];
  imports = [
    inputs.niri.homeModules.niri
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
