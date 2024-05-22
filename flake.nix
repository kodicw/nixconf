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
          imports = [ ./hosts/node-nadia/configuration.nix ];
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

      devShells."x86_64-linux".default =
        let
          pkgs = import nixpkgs { system = "x86_64-linux"; };
        in
        pkgs.mkShell {
          buildInputs = with pkgs; [
            nushellFull
            just
            gum
            lolcat
            git
            neovim
          ];
          shellHook = ''
            # echo "🗻 Minimal dev shell to get started" | lolcat
            # com=`echo "🌋 You can use the following commands:" | lolcat`
            # gum confirm "Quick start?" && echo $com && recipe=`just -l | grep rebuild | gum choose` && just $recipe
            # gum confirm "Exit dev shell?" && exit
            nu
            exit
          '';
        };
    };
}
