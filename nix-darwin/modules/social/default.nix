{ pkgs, ... }:
{
  imports = [
    ./discord
    ./wechat
  ];

  environment.systemPackages = with pkgs; [ ];
}
