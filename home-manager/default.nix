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
    ++ lib.optionals (!isVM) [
      ./modules/gui-tools
    ]
    ++ lib.optionals (isDarwin) [
      ./modules/forMacOS
    ]
    ++ lib.optionals (isLinux) [
      ./modules/forLinux
    ]
		;

  home = {
    inherit stateVersion;
    inherit username;
    homeDirectory = if isDarwin then "/Users/${username}" else "/home/${username}";

    sessionVariables = {
      EDITOR = "nvim";
    };
  };

  programs.home-manager.enable = true;

  fonts.fontconfig.enable = true;

  news.display = "silent";
}
