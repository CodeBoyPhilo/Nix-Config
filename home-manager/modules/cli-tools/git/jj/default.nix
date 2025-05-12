{
  config,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    jujutsu
  ];

  programs.jujutsu = {
    enable = true;
    settings = {
      user = {
        name = "Philo Wu";
        email = "philo.wu@codeboyphilo.ai";
      };
    };
  };

  programs.zsh = {
    shellAliases = {
      jl = "jj log";
      js = "jj st";
    };
  };
}
