{
  config,
  pkgs,
  inputs,
  ...
}:
{
  home.packages = [
    inputs.gittype.packages.${pkgs.system}.default
  ];
}
