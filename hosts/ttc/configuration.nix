{ 
  config, 
  pkgs, 
  lib,
  system,
  inputs,
  stylix,
  ... }:
{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ../modules/desktop
    ../modules/packages
  ];
  networking.hostName = "TTC";
  networking.networkmanager.enable = true;
  stylix = {
    wallpaper = lib.stylix.types.wallpaper.from.image {
      file = ./resources/omsi.jpg;
      polarity = "dark";
    };
  };

  services.flatpak.enable = true;
  services.kasmweb.enable = true;

  # Adds flathub as flatpak package repository
  nixpkgs.config = {
    flatpak.flathub = true;
  };
  environment.systemPackages = [
    inputs.nix-software-center.packages.${system}.nix-software-center
  ];

  users.users.ttc.isNormalUser = true;
  system.stateVersion = "23.11";
}
