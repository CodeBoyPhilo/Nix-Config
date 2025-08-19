{
  inputs,
  outputs,
  stateVersion,
  ...
}:
{
  # Helper function for generating home-manager configs
  mkHome =
    {
      hostname,
      username ? "phil_oh",
      platform ? "aarch64-darwin",
    }:
    let
      isDarwin = hostname == "m1-mbp" || hostname == "intel-mbp";
      isVM = hostname == "vm";
      isNixOS = hostname == "lanix" || hostname == "lenix";

      nixvimConfig = if isVM then inputs.my-minimal-nixvim-config else inputs.my-nixvim-config;

      nixvimSpecialArgs = {
        inputs = {
          nixpkgs = inputs.nixpkgs;
          nixvim = inputs.nixvim;
          blink-cmp = inputs.blink-cmp;
          self = nixvimConfig;
        };
        self = nixvimConfig;
      };

    in
    inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = inputs.nixpkgs.legacyPackages.${platform};
      extraSpecialArgs = {
        inherit
          inputs
          outputs
          hostname
          platform
          username
          stateVersion
          isDarwin
          isVM
          isNixOS
          ;
        my-nixvim-config = nixvimConfig;
        inherit nixvimSpecialArgs;
      };
      modules = [ ../home-manager ];
    };

  mkNixOS =
    {
      hostname,
      username ? "phil_oh",
      platform ? "x86_64-linux",
    }:
    let
      isVM = false;
    in
    inputs.nixpkgs.lib.nixosSystem {
      specialArgs = {
        inherit
          inputs
          outputs
          hostname
          platform
          username
          stateVersion
          isVM
          ;
      };
      modules = [ ../nixos ];
    };

  mkDarwin =
    {
      hostname,
      username ? "phil_oh",
      platform ? "aarch64-darwin",
    }:
    let
      isVM = false;
    in
    inputs.nix-darwin.lib.darwinSystem {
      specialArgs = {
        inherit
          inputs
          outputs
          hostname
          platform
          username
          isVM
          ;
      };
      modules = [ ../nix-darwin ];
    };

  forAllSystems = inputs.nixpkgs.lib.genAttrs [
    "aarch64-linux"
    "x86_64-linux"
    "aarch64-darwin"
    "x86_64-darwin"
  ];
}
