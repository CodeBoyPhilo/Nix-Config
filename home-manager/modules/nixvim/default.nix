{
  config,
  lib,
  pkgs,
  my-nixvim-config,
  nixvimSpecialArgs,
  ...
}:

{
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
