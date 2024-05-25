# Resources
# noogle https://noogle.odev
# nixos https://nixos.org
# mynixos https://mynixos.com
{
  # run the command below for quick menu
  description = "A simple config";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-software-center.url = "github:snowfallorg/nix-software-center";
    nixvim.url = "github:nix-community/nixvim";
    # nix-bitcoin.url = "github:fort-nix/nix-bitcoin/release";
    stylix.url = "github:danth/stylix";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

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
          modules = [ ./hosts/ttc/configuration.nix ];
        };

        "catalyst" = nixosSystem {
          specialArgs = { inherit inputs username system; };
          modules = [ ./hosts/catalyst/configuration.nix ];
        };

        "angel" = nixosSystem {
          specialArgs = { inherit inputs username system; };
          modules = [ ./hosts/angel/configuration.nix ];
        };
      };

      devShells."x86_64-linux".default =
        let
          pkgs = import nixpkgs { system = "x86_64-linux"; };
        in
        pkgs.mkShell {
          buildInputs = with pkgs; [
            nushell
            just
            git
            neovim
            nixpkgs-fmt
            manix
          ];
          shellHook = ''
            just -l
            nu
            exit
          '';
        };
    };
}
