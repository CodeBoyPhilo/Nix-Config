{ config, pkgs, ... }:
{

  home.packages = with pkgs; [
    duf
  ];

  programs.zsh = {
    shellAliases = {
      df = "duf";
    };
  };
}
