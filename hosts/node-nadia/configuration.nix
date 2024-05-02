{ config, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ../modules/server
      ./modules/networking
      ../modules/desktop
      ../modules/users/charles.nix
      ../modules/packages
      ../modules/nvidia.nix
    <nixpkgs/nixos/modules/virtualisation/qemu-vm.nix>
    ];
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

  services.tailscale = {
    enable = true;
    useRoutingFeatures = "both";
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  system.stateVersion = "23.05"; 
} 

 
