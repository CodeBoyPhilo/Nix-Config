{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    git
  ];

  programs.git = {
    enable = true;
    userName = "Philo Wu";
    userEmail = "philo.wu@codeboyphilo.ai";
  };
}
