{
  config,
  inputs,
  isDarwin,
  isVM,
  isNixOS,
  lib,
  outputs,
  pkgs,
  stateVersion,
  username,
  ...
}:
{
  imports = [
    inputs.nix-colors.homeManagerModules.default
    ./nixvim
    ./shell
    ./cli-core
    ./stylix
  ]
  ++ lib.optionals (isDarwin) [
    ./cli-add-on
    ./platforms/macos
    ./fonts
    ./wallpapers
  ]
  ++ lib.optionals (isNixOS) [
    ./cli-add-on
    ./platforms/nixos
    ./fonts
    ./wallpapers
  ];

  home = {
    inherit stateVersion;
    inherit username;
    homeDirectory = if isDarwin then "/Users/${username}" else "/home/${username}";

    sessionPath = [ "$HOME/.local/bin" ];

    sessionVariables = lib.mkMerge [
      {
        EDITOR = "nvim";
        NH_FLAKE = "$HOME/nix-config";
      }
      (lib.mkIf isNixOS {
        NIXOS_OZONE_WL = 1;
        # LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath [
        #   pkgs.stdenv.cc.cc
        #   pkgs.libGL
        #   pkgs.glib.out
        #   pkgs.libxcrypt-legacy
        #   "/run/opengl-driver"
        # ];
      })
    ];
  };

  programs.home-manager.enable = true;

  fonts.fontconfig.enable = true;

  news.display = "silent";
}
