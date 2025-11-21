{
  config,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    git
  ];

  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Philo Wu";
        email = "philo.wu@codeboyphilo.ai";
      };
    };
  };
}
