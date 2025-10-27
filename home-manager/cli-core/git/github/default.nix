{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    gh
  ];

  programs.gh = {
    enable = true;
  };
}
