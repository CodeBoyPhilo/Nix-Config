{ config, pkgs, ... }:
{
  services.mpd = {
    enable = true;
    musicDirectory = "/home/phil_oh/Music";
  };
}
