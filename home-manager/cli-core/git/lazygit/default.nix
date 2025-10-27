{
  config,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    lazygit
  ];

	stylix.targets.lazygit.enable = true;

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
