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
    initContent = ''
      autoload -z edit-command-line
      zle -N edit-command-line
      bindkey "^E" edit-command-line

      ${
        if hostname != "vm" then
          ''
            export AVANTE_ANTHROPIC_API_KEY=$(cat ${config.sops.secrets."api_keys/avante_anthropic".path})
            export AVANTE_OPENAI_API_KEY=$(cat ${config.sops.secrets."api_keys/avante_openai".path})
            export AVANTE_GEMINI_API_KEY=$(cat ${config.sops.secrets."api_keys/avante_gemini".path})
          ''
        else
          ""
      }
    '';
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
