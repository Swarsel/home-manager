{
  description = "Home Manager configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixpkgs-unstable = {
    		     url = "github:nixos/nixpkgs/nixpkgs-unstable";
    };
    
  };

  outputs = inputs@{ nixpkgs, nixpkgs-unstable, home-manager, ... }:
    let
      arch = "x86_64-linux";

      in {
        defaultPackage.${arch} =
        home-manager.defaultPackage.${arch};

    homeConfigurations.Swarsel = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${arch};
        modules = [
	    ./home.nix
	];
	extraSpecialArgs = {
			 pkgs-unstable = nixpkgs-unstable.legacyPackages.${arch};
	};
      };
    };
}