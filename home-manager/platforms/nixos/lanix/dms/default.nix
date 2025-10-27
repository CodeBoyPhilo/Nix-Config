{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.dankMaterialShell.homeModules.dankMaterialShell.default
    inputs.dankMaterialShell.homeModules.dankMaterialShell.niri
  ];
  programs.dankMaterialShell = {
    enable = true;
    enableSystemd = true;
    enableSystemMonitoring = true;
    enableClipboard = true;
    enableBrightnessControl = true;
    enableNightMode = true;
    enableAudioWavelength = true;
    enableSystemSound = true;
    niri = {
      enableKeybinds = false; # overwrite some in niri config
      enableSpawn = false; # use systemd
    };
  };
}
