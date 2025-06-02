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
      ./modules/nixvim
      ./modules/shell
      ./modules/cli-tools
      ./modules/fonts
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
      }
      (lib.mkIf isUbuntu{
        PATH = "/usr/local/cuda-12.8/bin:$HOME/.spicetify:$HOME/.cargo/bin:$PATH";
        LD_LIBRARY_PATH = "/usr/local/cuda-12.8/lib64:$LD_LIBRARY_PATH";
				WLR_NO_HARDWARE_CURSORS = 1;
				MOZ_ENABLE_WAYLAND=1;
				HYPRSHOT_DIR="$HOME/Pictures/screenshots";
      })
    ];
  };

  programs.home-manager.enable = true;

  fonts.fontconfig.enable = true;

  news.display = "silent";
}
