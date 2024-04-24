
{
  description = "A simple config";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    nixvim.url = "github:nix-community/nixvim";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixvim, home-manager, nixpkgs }@inputs:
    let
      system = "x86_64-linux";
      username = "charles";
    in
    {
      nixosConfigurations."mainframe" = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs username system; };
        modules = [ ./hosts/mainframe/configuration.nix ];
      };

      nixosConfigurations."node-nadia" = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs username system; };
        modules = [ ./hosts/node-nadia/configuration.nix ];
      };

      nixosConfigurations."ttc" = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs username system; };
        modules = [ ./hosts/ttc/configuration.nix ];
      };

      nixosConfigurations."angel" = nixpkgs.lib.nixosSystem {
        specialArgs = { inherit inputs username system; };
        modules = [ ./hosts/angel/configuration.nix ];
      };


      homeConfigurations."${username}" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
        extraSpecialArgs = { inherit inputs username; };
        modules = [ ./home-manager/home.nix ];
      };
    };
}
