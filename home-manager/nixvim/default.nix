{
  config,
  lib,
  pkgs,
  my-nixvim-config,
  nixvimSpecialArgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.nixvim.homeModules.default
  ];
  programs.nixvim = {
    enable = true;
    imports = [
      {
        imports = [ "${my-nixvim-config}/config" ];
        _module.args = nixvimSpecialArgs;
      }
    ];
  };
}
