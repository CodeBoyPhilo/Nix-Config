{
  config,
  pkgs,
	username,
	hostname,
  ...
}:
{
  home.packages = with pkgs; [
    zsh
  ];

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      c = "clear";
    };
    history.size = 10000;
    oh-my-zsh = {
      enable = true;
    };
    zplug = {
      enable = true;
      plugins = [
        { name = "jeffreytse/zsh-vi-mode"; }
      ];
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
