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
}
