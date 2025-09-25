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
    inputs.nixvim.homeManagerModules.default
    inputs.stylix.homeModules.stylix
    inputs.nix-colors.homeManagerModules.default
    ./modules/nixvim
    ./modules/shell
    ./modules/cli-tools
    ./modules/stylix
  ]
  ++ lib.optionals (isDarwin) [
    ./modules/platforms/macos
    ./modules/fonts
    ./modules/wallpapers
  ]
  ++ lib.optionals (isNixOS) [
    ./modules/platforms/nixos
    ./modules/fonts
    ./modules/wallpapers
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
        NIXOS_OZONE_WL = "1";
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
