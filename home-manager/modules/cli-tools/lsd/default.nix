{ pkgs, lib, ... }:

{
  home.packages = with pkgs; [
    lsd
  ];

  programs.lsd = {
    enable = true;
		enableZshIntegration = true;
		settings = {
		total-size = true;
		hyperlink = "auto";
		};
  };
}
