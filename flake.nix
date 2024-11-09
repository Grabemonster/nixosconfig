{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixvim, ... }@inputs: 
  let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;

      config = {
        allowUnfree = true;
      };
    };
  in
  {
    nixosConfigurations = {
      default = nixpkgs.lib.nixosSystem {
	    specialArgs = {
          inherit system; 
	      inherit inputs;
	    };
	

          modules = [
	        ./hosts/default/configuration.nix
            inputs.home-manager.nixosModules.default 
	      ];
      };
      };
    homeConfiguration = {
        default = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {inherit inputs; inherit nixvim;};
          modules = [
            ./home/default/home.nix

          ];
        };
    };
  };
}
