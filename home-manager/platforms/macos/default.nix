{ config, pkgs, ... }:
{
  imports = [
    ./aerospace
    ./gemini-cli
    ./ghostty
    ./kitty
    ./neovide
    ./skim
    ./texlive
    ./typst
    ./wezterm
  ];

  home.file = {
    ".hushlogin".text = "";
  };
}
