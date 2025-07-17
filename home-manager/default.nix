{
  config,
  inputs,
  isDarwin,
  isVM,
  isUbuntu,
  isNixOS,
  lib,
  outputs,
  pkgs,
  stateVersion,
  username,
  ...
}:
{
  imports =
    [
      inputs.nixvim.homeManagerModules.default
      inputs.stylix.homeModules.stylix
      inputs.nix-colors.homeManagerModules.default
      ./modules/nixvim
      ./modules/shell
      ./modules/cli-tools
      ./modules/fonts
      ./modules/stylix
      ./modules/wallpapers
    ]
    ++ lib.optionals (isDarwin) [
      ./modules/platforms/macos
    ]
    ++ lib.optionals (isUbuntu) [
      ./modules/platforms/ubuntu
    ]
    ++ lib.optionals (isNixOS) [
      ./modules/platforms/nixos
    ];

  home = {
    inherit stateVersion;
    inherit username;
    homeDirectory = if isDarwin then "/Users/${username}" else "/home/${username}";

    sessionVariables = lib.mkMerge [
      {
        EDITOR = "nvim";
				NH_FLAKE = "$HOME/nix-config";
				AVANTE_ANTHROPIC_API_KEY = ''$(cat ${config.sops.secrets."api_keys/avante_anthropic".path})'';
				AVANTE_OPENAI_API_KEY = ''$(cat ${config.sops.secrets."api_keys/avante_openai".path})'';
			  AVANTE_GEMINI_API_KEY = ''$(cat ${config.sops.secrets."api_keys/avante_gemini".path})'';
      }
      (lib.mkIf isUbuntu {
        PATH = "/usr/local/cuda-12.8/bin:$HOME/.spicetify:$HOME/.cargo/bin:$PATH";
        LD_LIBRARY_PATH = "/usr/local/cuda-12.8/lib64:$LD_LIBRARY_PATH";
        WLR_NO_HARDWARE_CURSORS = 1;
        MOZ_ENABLE_WAYLAND = 1;
        HYPRSHOT_DIR = "$HOME/Pictures/screenshots";
      })
      (lib.mkIf isNixOS {
			  PATH = "$HOME/.local/bin:$PATH";
        NIXOS_OZONE_WL = "1";
        LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
          pkgs.stdenv.cc.cc
          pkgs.libGL
          pkgs.glib.out
          pkgs.libxcrypt-legacy
          "/run/opengl-driver"
        ];
      })
    ];
  };

  programs.home-manager.enable = true;

  fonts.fontconfig.enable = true;

  news.display = "silent";
}
