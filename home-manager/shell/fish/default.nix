{
  config,
  pkgs,
  username,
  hostname,
  ...
}:
{
  home.packages = with pkgs; [
    fish
  ];

  programs.fish = {
    enable = true;
    shellAliases = {
      c = "clear";
    };
    shellInit = ''
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
    enableFishIntegration = true;
  };
}
