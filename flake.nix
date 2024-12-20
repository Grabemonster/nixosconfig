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

    hyprpanel = {
      url = "github:Jas-SinghFSU/HyprPanel";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, nixvim, hyprpanel, nur, ... }@inputs: 
  let
    system = "x86_64-linux";

    user = "grabemonster";

    pkgs = import nixpkgs {
      inherit system;
      overlays = [nur.overlays];

      config = {
        allowUnfree = true;
      };
    };
  in
  {
    nixosConfigurations = {
      default = nixpkgs.lib.nixosSystem {
	    specialArgs = {inherit system; inherit inputs; inherit user;};
  
        modules = [
           nur.modules.nixos.default
           # NUR modules to import
           nur.legacyPackages."${system}".repos.iopq.modules.xraya
           ./hosts/default/configuration.nix
           inputs.home-manager.nixosModules.default 
        ];
      };
    };
    homeConfiguration = {
        default = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          overlays = [
            inputs.hyprpanel.overlays
          ];
          extraSpecialArgs = {inherit inputs; inherit nixvim; inherit hyprpanel; inherit user;};
          modules = [
            ./home/default/home.nix
            
          ];
        };
    };
  };
}
