{
  config,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    lazygit
  ];

  programs.lazygit = {
    enable = true;
    settings = {
      gui.authorColors = {
        "Philo Wu" = "blue";
      };
    };
  };

  programs.zsh = {
    shellAliases = {
      lg = "lazygit";
    };
  };
}
