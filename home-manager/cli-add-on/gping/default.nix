{ config, pkgs, ... }:
{

  home.packages = with pkgs; [
    gping
  ];

  programs.zsh = {
    shellAliases = {
      ping = "gping";
    };
  };
  
	programs.fish = {
    shellAliases = {
      ping = "gping";
    };
  };
}
