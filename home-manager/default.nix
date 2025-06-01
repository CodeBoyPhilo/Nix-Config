{
  config,
  inputs,
  isDarwin,
  isVM,
  isLinux,
  lib,
  outputs,
  pkgs,
  stateVersion,
  username,
  ...
}:
# let
#   inherit (pkgs.stdenv) isDarwin isLinux;
# in
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
      ./modules/gui-tools
    ]
    ++ lib.optionals (isLinux) [
      ./modules/add-ons
    ];

  home = {
    inherit stateVersion;
    inherit username;
    homeDirectory = if isDarwin then "/Users/${username}" else "/home/${username}";

    sessionVariables = lib.mkMerge [
      {
        EDITOR = "nvim";
      }
      (lib.mkIf isLinux {
        PATH = "/usr/local/cuda-12.8/bin:$HOME/.spicetify:$HOME/.cargo/bin:$PATH";
        LD_LIBRARY_PATH = "/usr/local/cuda-12.8/lib64:$LD_LIBRARY_PATH";
				WLR_NO_HARDWARE_CURSORS = 1;
				MOZ_ENABLE_WAYLAND=1;
				HYPRSHOT_DIR="$HOME/Pictures/screenshots";
      })
    ];

    #  sessionVariables = {
    #    EDITOR = "nvim";
    # PATH = "/usr/local/cuda-12.8/bin:$PATH";
    # LD_LIBRARY_PATH="/usr/local/cuda-12.8/lib64:$LD_LIBRARY_PATH";
    #  };
  };

  programs.home-manager.enable = true;

  fonts.fontconfig.enable = true;

  news.display = "silent";
}
