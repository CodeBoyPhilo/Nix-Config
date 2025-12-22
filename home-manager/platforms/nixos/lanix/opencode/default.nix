{ config, pkgs, ... }:
{
  programs.opencode = {
    enable = true;
    settings = {
      permission = {
        bash = "ask";
        edit = "ask";
        webfetch = "ask";
      };
      theme = "catppuccin";
    };
  };
}
