{ config, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ../modules/server
      ../modules/network
      ../modules/desktop
      ../modules/users/charles.nix
      ../modules/packages
      ../modules/nvidia.nix
    ];

  myPlasma.enable = true;
  mySddm.enable = true;
  myHomepageDashboard.enable = true;
  myAdguardHome.enable = true;
  my.photoprism.enable = true;
  my.soft-serve.enable = true;

  services.ollama.enable = true;

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader = {
    grub.enable = true;
    grub.device = "/dev/sda";
    grub.useOSProber = true;
  };

  networking = {
    hostName = "node-nadia";
    networkmanager.enable = true;
  };

  services.tailscale.useRoutingFeatures = "both";

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.light.enable = true;

  environment.variables = {
    EDITOR = "nvim";
  };


  system.stateVersion = "23.05";
  nixpkgs.hostPlatform = "x86_64-linux";
} 

 
