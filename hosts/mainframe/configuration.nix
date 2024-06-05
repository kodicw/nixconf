{ config, pkgs, ... }:
{
  imports =
    [
      /etc/nixos/hardware-configuration.nix
      ../modules
    ];

  my = {
    desk = {
      hyprland.enable = true;
      sddm.enable = true;
      plasma.enable = true;
    };
    users = {
      charles.enable = true;
      phoenix.enable = true;
      angel.enable = true;
    };
    nix.settings.enable = true;
    gaming.setup.enable = true;
    remoteAccess.enable = true;
    developer.env.enable = true;
  };

  drivers.nvidia.enable = true;

  boot.loader = {
    efi = {
      efiSysMountPoint = "/boot/efi";
    };
    grub = {
      enable = true;
      device = "nodev";
      theme = "${import ./fallout-grub-theme.nix { inherit pkgs; }}";
    };
  };

  # Networking
  networking = {
    hostName = "mainframe";
    networkmanager.enable = true;
    interfaces.br0 = {
      useDHCP = true;
      virtual = true;
    };
    interfaces.pf0 = {
      virtual = true;
      useDHCP = true;
    };
    bridges = {
      br0 = {
        interfaces = [ "enp2s0" ];
      };
    };
  };

  environment.variables = {
    FLAKE = "/etc/nixos/";
  };


  system.stateVersion = "23.05";
} 
