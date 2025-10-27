{ config, pkgs, ... }:
{

  home.packages = with pkgs; [
    source-serif
    fira
    maple-mono.NF-CN
    noto-fonts-emoji
    noto-fonts-monochrome-emoji
		sketchybar-app-font
		wqy_zenhei
  ];

  fonts.fontconfig = {
    enable = true;
    defaultFonts = {
      serif = [
        "Source Serif"
				"wqy_zenhei"
        "Noto Color Emoji"
      ];
      sansSerif = [
        "Fira Sans"
				"wqy_zenhei"
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
