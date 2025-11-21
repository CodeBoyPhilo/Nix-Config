{ config, pkgs, ... }:
{
  virtualisation.docker = {
    enable = true;
  };
	users.users.phil_oh.extraGroups = [ "docker" ];
  hardware.nvidia-container-toolkit.enable = true;
  environment.systemPackages = [ pkgs.distrobox ];
}
