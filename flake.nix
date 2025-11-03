{
  description = "Nix Darwin Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
		nix-homebrew.url = "github:zhaofengli-wip/nix-homebrew";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";

		darwin = {
			url = "github:LnL7/nix-darwin/master";
			inputs.nixpkgs.follows = "nixpkgs";
		};

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
		
		homebrew-bundle = {
			url = "github:homebrew/homebrew-bundle";
			flake = false;
		};

		homebrew-core = {
			url = "github:homebrew/homebrew-core";
			flake = false;
		};

		homebrew-cask = {
			url = "github:homebrew/homebrew-cask";
			flake = false;
		};
  };

  outputs = { self, darwin, nixpkgs, home-manager, nix-homebrew, homebrew-bundle, homebrew-core, homebrew-cask, ... } @inputs:

  let
		user = "lush";
    nixpkgsConfig = {
      config = {
				allowUnfree = true;
				allowUnsupportedSystem = true;
        allowBroken = true;
			};
      overlays = [inputs.neovim-nightly-overlay.overlays.default];
    };
  in
  {
    darwinConfigurations = rec {
      odinsbeard = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        lib = nixpkgs.lib;
        modules = [
					home-manager.darwinModules.home-manager
					nix-homebrew.darwinModules.nix-homebrew
					({ config, ... }: {
						system.primaryUser = user;
					})
					{
						nix-homebrew = {
							enable = true;
							user = "${user}";
							autoMigrate = true;
						};
					}
					{
						nixpkgs = nixpkgsConfig;
						home-manager.extraSpecialArgs = { inherit inputs; };
						home-manager.useGlobalPkgs = true;
						home-manager.useUserPackages = true;
						home-manager.users.${user} = import ./modules/home-manager;
					}
					./hosts/darwin
				];
      };
    };
  };
}
