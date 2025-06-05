{
  config,
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    # For NixOS
    inputs.spicetify-nix.nixosModules.default
  ];
  environment.systemPackages = with pkgs; [
    spotify
  ];

  programs.spicetify =
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      enable = true;

      enabledExtensions = with spicePkgs.extensions; [
        beautifulLyrics
      ];

      # enabledCustomApps = with spicePkgs.apps; [
      #   lyricsPlus
      # ];

      theme = spicePkgs.themes.comfy;
      colorScheme = "catppuccin-mocha";
    };
}
