{
  description = "Nix Darwin Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-23.11-darwin";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    darwin.url = "github:LnL7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs-unstable";

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
		nixvim.url = "github:nix-community/nixvim";
  };

  outputs = { self, darwin, nixpkgs, home-manager, nixvim, ... }@inputs:

  let
    homeStateVersion = "24.05";

    nixpkgsConfig = {
      config = {
				allowUnfree = true;
				allowUnsupportedSystem = true;
			};
      overlays = [inputs.neovim-nightly-overlay.overlay];
    };
  in
  {
    # Configurations ------------------------------------------------------------------------

    darwinConfigurations = rec {
      hyprnova = darwin.lib.darwinSystem {
        system = "x86_64-darwin";
        modules = [
          home-manager.darwinModules.home-manager
          {
            nixpkgs = nixpkgsConfig;
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.lushsleutsky = import ./hosts/darwin/home.nix;
          }
					nixvim.nixDarwinModules.nixvim
          ./hosts/darwin
        ];
      };
    };
  };
}
