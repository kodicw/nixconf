{ config, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ../modules
    ];

  my = {
    desk = {
      sddm.enable = true;
      plasma.enable = true;
    };
    users.charles.enable = true;
    remoteAccess.enable = true;
    servers = {
      adguardHome.enable = true;
      photoprism.enable = true;
      soft-serve.enable = true;
      homepage.enable = true;
    };
  };
  drivers.nvidia.enable = true;


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

 
