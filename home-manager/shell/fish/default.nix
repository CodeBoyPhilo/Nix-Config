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
    binds = {
      "ctrl-e".command = "edit_command_buffer";
    };
    shellAliases = {
      c = "clear";
    };
    interactiveShellInit = ''
			set -g fish_color_command blue --bold
			set -g fish_color_param normal

      function fish_greeting
				fastfetch
				echo 
      end

			function clear
				command clear
				fish_greeting
			end
    '';
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
    shellInitLast = ''
      fish_vi_key_bindings
    '';
    plugins = [
      {
        name = "autopair";
        src = pkgs.fishPlugins.autopair.src;
      }
    ];
  };
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
  };
}
