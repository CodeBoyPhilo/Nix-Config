{
  config,
  hostname,
  inputs,
  lib,
  outputs,
  pkgs,
  platform,
  username,
  ...
}:
{
  imports = [
    ./hardware-configuration.nix
    ./modules/system
    ./modules/services
    ./modules/apps
  ];

  system.stateVersion = "25.05";

  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      trusted-users = [
        "root"
        "phil_oh"
      ];
    };
  };

  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = lib.mkDefault "${platform}";
  };

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.printing.enable = true;

  environment.systemPackages = with pkgs; [
    vim
    wget
    curl
    blueman
    cachix
    wl-clipboard
    playerctl
    gparted
    polkit_gnome
		nh
		nix-output-monitor
		nvd
    cudaPackages.cudatoolkit
  ];

  programs.zsh.enable = true;
  programs.nix-ld.enable = true;

}
