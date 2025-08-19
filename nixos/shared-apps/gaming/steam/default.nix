{
  config,
  pkgs,
  inputs,
  ...
}:
{
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true; # For Steam Remote Play
    dedicatedServer.openFirewall = true; # For Source Dedicated Server hosting
    gamescopeSession.enable = true;
    extraCompatPackages = with pkgs; [
      mangohud
    ];
  };
  environment.systemPackages = with pkgs; [
    protonup
  ];
  environment.sessionVariables = {
    STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/phil_oh/.steam/root/compatibilitytools.d";
  };
}
