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
			isVM = hostname == "hm";
			isLinux = hostname == "kubulabu";

      nixvimSpecialArgs = {
        inputs = {
          nixpkgs = inputs.nixpkgs;
          nixvim = inputs.nixvim;
          blink-cmp = inputs.blink-cmp;
          self = inputs.my-nixvim-config;
        };
        self = inputs.my-nixvim-config;
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
					isLinux
          ;
        my-nixvim-config = inputs.my-nixvim-config;
        inherit nixvimSpecialArgs;
      };
      modules = [ ../home-manager ];
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
