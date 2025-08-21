{
  config,
  pkgs,
  hostname,
  ...
}:
{
  networking.hostName = hostname;
  networking.networkmanager = {
    enable = true;
    # wifi.backend = "iwd";
  };
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 ];
  };
  environment.systemPackages = [
    pkgs.networkmanagerapplet
  ];
}
