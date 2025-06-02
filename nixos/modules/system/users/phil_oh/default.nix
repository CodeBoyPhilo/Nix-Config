{ config, pkgs, ... }:
{
  users.users.phil_oh = {
    isNormalUser = true;
    description = "Philo Wu";
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
      kdePackages.kate
      #  thunderbird
    ];
    shell = pkgs.zsh;
  };
}
