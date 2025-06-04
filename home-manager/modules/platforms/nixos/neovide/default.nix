{ config, pkgs, ... }:

{

  home.packages = with pkgs; [
    neovide
  ];

  programs.neovide = {
    enable = true;
    settings = {
      frame = "none";
      font = {
        normal = [ "Maple Mono NF CN" ];
        size = 19;
      };
      maximized = true;
    };
  };

  programs.zsh = {
    shellAliases = {
      nv = "neovide";
    };
  };

}
