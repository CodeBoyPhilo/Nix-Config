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
    openssh.authorizedKeys.keys = [
      (builtins.readFile ../../../../../keys/lanix/id_ed25519.pub)
      (builtins.readFile ../../../../../keys/m1-mbp/id_ed25519.pub)
      (builtins.readFile ../../../../../keys/ipad-pro/id_ed25519.pub)
      (builtins.readFile ../../../../../keys/ipad-air/id_ed25519.pub)
    ];
  };
}
