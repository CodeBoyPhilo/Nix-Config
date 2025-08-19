{
  config,
  pkgs,
  ...
}:
{
  security.polkit.enable = true;
  environment.systemPackages = [
    pkgs.hyprpolkitagent
		pkgs.lxqt.lxqt-policykit
  ];
}
