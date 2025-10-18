{ config, pkgs, ... }:
{
  programs.dankMaterialShell = {
    enable = true;
    enableSystemd = true;
    enableSystemMonitoring = true;
		enableClipboard = true;
		enableBrightnessControl = true;
		enableNightMode = true;
		enableAudioWavelength = true;
		enableSystemSound = true;
  };
}
