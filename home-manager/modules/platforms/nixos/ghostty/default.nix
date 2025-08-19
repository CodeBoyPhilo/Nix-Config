{
  config,
  pkgs,
  hostname,
  ...
}:
{
  imports = [ ./${hostname} ];
}
