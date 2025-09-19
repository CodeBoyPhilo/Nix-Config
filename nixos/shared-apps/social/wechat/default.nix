{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    wechat
  ];
}
