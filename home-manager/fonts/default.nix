{
  config,
  pkgs,
  isNixOS,
  ...
}:
{

  home.packages =
    with pkgs;
    [
      source-serif
      fira
      maple-mono.NF-CN
      noto-fonts-color-emoji
      noto-fonts-monochrome-emoji
      sketchybar-app-font
      wqy_zenhei
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
    ]
    ++ lib.optionals (isNixOS) [
      adwaita-fonts
    ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = [
        "Source Serif"
        "Noto Serif CJK SC Black"
        "Noto Color Emoji"
      ];
      sansSerif = [
        "Fira Sans"
        "Adwaita Sans"
        "Noto Sans CJK SC Black"
        "Noto Color Emoji"
      ];
      monospace = [
        "Maple Mono NF CN"
        "Noto Emoji"
      ];
      emoji = [
        "Noto Color Emoji"
      ];
    };

  };
}
