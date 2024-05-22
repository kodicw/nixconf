{ config, lib, pkgs, system, inputs, ... }:
let
  cfg = config.my.nix.appStore;
in
with lib;
{
  options = {
    my.nix.appStore.enable = mkEnableOption "Enable My Nix settings";
  };
  config = mkIf cfg.enable {
    nixpkgs.config = {
      flatpak.flathub = true;
    };
    services.flatpak.enable = true;
    environment.systemPackages = [
      inputs.nix-software-center.packages.${system}.nix-software-center
    ];
  };
}
