{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    ssh-to-age
  ];
  services = {
    openssh = {
      enable = true;
      settings = {
        PasswordAuthentication = false;
        PermitRootLogin = "no";
      };
    };
  };
}
