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
		systemd.enable = true;
    enableSystemMonitoring = true;
    enableClipboard = true;
    enableBrightnessControl = true;
    enableAudioWavelength = true;
    enableSystemSound = true;
    niri = {
      enableKeybinds = false; # overwrite some in niri config
      enableSpawn = false; # use systemd
    };
  };
}
