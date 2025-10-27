{
  config,
  hostname,
  pkgs,
  ...
}:
{
  imports = [
    ./${hostname}
  ];
}
