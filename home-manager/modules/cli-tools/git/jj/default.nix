{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    jujutsu
  ];

  programs.jujutsu= {
    enable = true;
  };
}
