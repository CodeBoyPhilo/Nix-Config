{ config, pkgs, ... }:

{

  home.packages = with pkgs; [
    (writeShellScriptBin "neovide-with-avante" ''
      			export AVANTE_ANTHROPIC_API_KEY="$(cat ${config.sops.secrets."api_keys/avante_anthropic".path})"
      			export AVANTE_OPENAI_API_KEY="$(cat ${config.sops.secrets."api_keys/avante_openai".path})"
      			export AVANTE_GEMINI_API_KEY="$(cat ${config.sops.secrets."api_keys/avante_gemini".path})"
      			exec ${pkgs.neovide}/bin/neovide "$@"
      		'')
  ];

  programs.neovide = {
    enable = true;
    settings = {
      frame = "none";
      font = {
        normal = [ "Maple Mono NF CN" ];
        size = 15;
      };
      maximized = true;
    };
  };

  programs.zsh = {
    shellAliases = {
      nv = "neovide";
    };
  };

  programs.fish = {
    shellAliases = {
      nv = "neovide";
    };
  };
}
