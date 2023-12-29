{
  description = "Nix Darwin Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-23.11-darwin";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    darwin.url = "github:LnL7/nix-darwin/master";
    darwin.inputs.nixpkgs.follows = "nixpkgs-unstable";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs-unstable";

    comma = { url = "github:Shopify/comma"; flake = false; };
  };

  outputs = { self, darwin, nixpkgs, home-manager, ... }@inputs:
  let
    homeStateVersion = "24.05";
 
    nixpkgsConfig = {
      config = { allowUnfree = true; };
    };
  in
  {
    # Configurations ------------------------------------------------------------------------

    darwinConfigurations = rec {
      hyprnova = darwin.lib.darwinSystem {
        system = "x86_64-darwin";
        modules = [
          ./configuration.nix
          home-manager.darwinModules.home-manager
          {
            nixpkgs = nixpkgsConfig;
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.lushsleutsky = import ./home.nix;
          }
        ];
      };
    };

    # Overlays ------------------------------------------------------------------------------

    overlays = {
      comma = final: prev: {
        comma = import inputs.comma { inherit (prev) pkgs; };
      };
    };
  };
}
