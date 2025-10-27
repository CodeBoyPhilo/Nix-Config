{ config, pkgs, ... }:

{
  # use home-manager to manager the config, but install it using homebrew in nix-darwin
  # due to nixpkgs mark it as broken
  home.file = {
    ".config/ghostty/config" = {
      source = ./config;
    };
    ".config/ghostty/themes" = {
      source = ./themes;
      recursive = true;
    };
  };

}
