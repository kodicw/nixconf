{ config, pkgs, ... }:
{
  imports =
    [
      /etc/nixos/hardware-configuration.nix
      ../modules/users
      ../modules/server/nextcloud.nix
      ../modules/desktop
      ../modules/network
      ../modules/packages
      ../modules/nvidia.nix
    ];

  nix = {
    gc.automatic = true;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
  };

  boot.loader = {
    efi = {
    # efiSysMountPoint = "/boot/efi";
  };
    grub = {
      enable = true;
      efiSupport = true;
      device = "nodev";
      useOSProber = true;
      theme =  "${import ./fallout-grub-theme.nix {inherit pkgs;}}";
    };
  };

  # Networking
  networking = {
    hostName = "mainframe";
    networkmanager.enable = true;
  };

  # Auto updates
  system.autoUpgrade = { 
    enable = true;
    allowReboot = true;
    channel = "https://nixos.org/channels/nixos-unstable";
  };


  system.stateVersion = "23.05";
} 
