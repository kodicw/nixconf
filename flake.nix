{
  description = "A simple config";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-software-center.url = "github:snowfallorg/nix-software-center";
    nixvim.url = "github:nix-community/nixvim";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    stylix.url = "github:danth/stylix";
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    { self
    , nixvim
    , home-manager
    , nixpkgs
    , nix-software-center
    , stylix
    , disko
    }@inputs:
    let
      system = builtins.currentSystem;
      username = "charles";
      nixosSystem = nixpkgs.lib.nixosSystem;
    in
    {
      nixosConfigurations = {

        "mainframe" = nixosSystem {
          specialArgs = { inherit inputs username system; };
          modules = [ ./hosts/mainframe/configuration.nix ];
        };

        "node-nadia" = nixosSystem {
          specialArgs = { inherit inputs username system; };
          modules = [ ./hosts/node-nadia/configuration.nix ];
        };

        "ttc" = nixosSystem {
          specialArgs = { inherit inputs username system; };
          modules = [./hosts/ttc/configuration.nix];
        };

       "nix-anywhere" = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/nix-anywhere/configuration.nix
        ];
      };


        "angel" = nixosSystem {
          specialArgs = { inherit inputs username system; };
          modules = [ ./hosts/angel/configuration.nix ];
        };
      };

      colmena = {
        meta = {
          nixpkgs = import nixpkgs {
          system = "x86_64-linux";
          };
        };
        node-nadia = {
          deployment = {
            targetHost = "node-nadia";
          };
          imports = [./hosts/node-nadia/configuration.nix];
        };
      };
            


      homeConfigurations = {
        "charles" = home-manager.lib.homeManagerConfiguration {
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };
          extraSpecialArgs = { inherit inputs username; };
          modules = [ ./home-manager/home.nix ];
        };
      };
    };
}
