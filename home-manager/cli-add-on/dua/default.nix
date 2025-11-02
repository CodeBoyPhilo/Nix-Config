{ config, pkgs, ... }:
{

  home.packages = with pkgs; [
    dua
  ];

  programs.zsh = {
    shellAliases = {
      du = "dua i";
    };
  };
  
	programs.fish= {
    shellAliases = {
      du = "dua i";
    };
  };
}
