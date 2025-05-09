{ pkgs, ... }:
{
  imports = [
	  ./adobe-acrobat
		./skim
		./zotero
  ];

  environment.systemPackages = with pkgs; [ ];
}

