{ config, pkgs, ... }:
{
  imports = [
    ./aerospace
    ./gemini-cli
    ./ghostty
    ./kitty
    ./neovide
    ./sketchybar
    ./skim
    ./texlive
    ./typst
    ./wezterm
  ];

  home.file = {
    ".hushlogin".text = "";
  };
}
