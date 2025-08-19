{ config, pkgs, ... }:
{
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5.addons = with pkgs; [
      fcitx5-gtk # alternatively, kdePackages.fcitx5-qt
      fcitx5-chinese-addons # table input method support
      fcitx5-nord # a color theme
    ];
  };
  services.xserver.desktopManager.runXdgAutostartIfNone = true;
  i18n.inputMethod.fcitx5.waylandFrontend = true;
}
