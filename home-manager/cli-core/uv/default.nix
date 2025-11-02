{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    uv
  ];

  programs.zsh.shellAliases = lib.mkIf (pkgs.uv != null) {
    "pip" = "uv pip";
    "venv" = "uv venv";
    "de" = "deactivate";
  };
  programs.fish.shellAliases = lib.mkIf (pkgs.uv != null) {
    "pip" = "uv pip";
    "venv" = "uv venv";
    "de" = "deactivate";
  };
}
