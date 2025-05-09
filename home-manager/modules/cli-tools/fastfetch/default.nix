{
  config,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    fastfetch
  ];

  programs.fastfetch = {
    enable = true;
    package = pkgs.fastfetch;
    settings = {
      logo = {
        source = ./cat.txt;
        padding = {
          right = 7;
          top = 0;
        };
      };
      modules = [
        "title"
        "os"
        "terminal"
        "cpu"
        "gpu"
        "battery"
      ];
    };
  };
}
