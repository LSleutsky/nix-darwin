{
  description = "Nix Darwin Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    darwin.url = "github:LnL7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
		nixvim.url = "github:nix-community/nixvim";
    yazi.url = "github:sxyazi/yazi";
  };

  outputs = { self, darwin, nixpkgs, home-manager, chaotic, nixvim, ... }@inputs:

  let
    homeStateVersion = "24.05";

    nixpkgsConfig = {
      config = {
				allowUnfree = true;
				allowUnsupportedSystem = true;
        allowBroken = true;
			};
      overlays = [inputs.neovim-nightly-overlay.overlay];
    };
  in
  {
    darwinConfigurations = rec {
      hyprnova = darwin.lib.darwinSystem {
        system = "x86_64-darwin";
        lib = nixpkgs.lib;
        modules = [
          home-manager.darwinModules.home-manager
          {
            nixpkgs = nixpkgsConfig;
            home-manager.extraSpecialArgs = { inherit inputs; };
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.lushsleutsky = import ./modules/home-manager;
          }
          chaotic.homeManagerModules.default
					nixvim.nixDarwinModules.nixvim
          ./modules/nixvim
          ./hosts/darwin
        ];
      };
    };
  };
}
