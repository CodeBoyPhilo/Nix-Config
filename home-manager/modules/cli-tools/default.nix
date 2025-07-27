{
  config,
  isDarwin,
  isVM,
  isNixOS,
  lib,
  pkgs,
  ...
}:
{
  imports =
    [
      ./core
    ]
    ++ lib.optionals (isDarwin) [
      ./add-on
    ]
    ++ lib.optionals (isNixOS) [
      ./add-on
    ];
}
