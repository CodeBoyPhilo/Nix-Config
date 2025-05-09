{ config, pkgs, ... }:
{

  home.packages = with pkgs; [
    procs
  ];

  programs.zsh = {
    shellAliases = {
      ps = "procs";
    };
  };
}
