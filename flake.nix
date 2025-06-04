{
  description = "Philo's nix-darwin and Home Manager Configuration";
  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };
  inputs = {
    fh.url = "https://flakehub.com/f/DeterminateSystems/fh/*";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    nix-darwin.url = "github:LnL7/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    homebrew-bundle = {
      url = "github:homebrew/homebrew-bundle";
      flake = false;
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    blink-cmp = {
      url = "github:saghen/blink.cmp";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    my-nixvim-config = {
      url = "github:codeboyphilo/nixvim-config";
      # url = "path:/home/phil_oh/.config/nixvim"; # local path for testing

      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nixvim.follows = "nixvim";
      inputs.blink-cmp.follows = "blink-cmp";
    };

    sops-nix.url = "github:Mic92/sops-nix";
		hyprland.url = "github:hyprwm/Hyprland";
  };
  outputs =
    {
      self,
      nix-darwin,
      nixpkgs,
      nix-homebrew,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      stateVersion = "25.05";
      helper = import ./lib { inherit inputs outputs stateVersion; };

    in
    {
      homeConfigurations = {
        # MacBooks
        "phil_oh@m1-mbp" = helper.mkHome {
          hostname = "m1-mbp";
          platform = "aarch64-darwin";
        };
        "phil_oh@intel-mbp" = helper.mkHome {
          hostname = "intel-mbp";
          platform = "x86_64-darwin";
        };
        # VMs
        "phil_oh@hm" = helper.mkHome {
          hostname = "hm";
          platform = "aarch64-linux";
        };
        # Linux
        "phil_oh@kubulabu" = helper.mkHome {
          hostname = "kubulabu";
          platform = "x86_64-linux";
        };
        "phil_oh@lanix" = helper.mkHome {
          hostname = "lanix";
          platform = "x86_64-linux";
        };
      };

      nixosConfigurations = {
        lanix = helper.mkNixOS {
          hostname = "lanix";
          platform = "x86_64-linux";
        };
      };

      darwinConfigurations = {
        m1-mbp = helper.mkDarwin {
          hostname = "m1-mbp";
          platform = "aarch64-darwin";
        };
        intel-mbp = helper.mkDarwin {
          hostname = "intel-mbp";
          platform = "x86_64-darwin";
        };
      };
    };
}
