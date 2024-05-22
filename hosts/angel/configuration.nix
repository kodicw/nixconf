{ config, pkgs, ... }:
{
  imports =
    [
      /etc/nixos/hardware-configuration.nix
      ../modules
    ];
  my = {
    desk = {
      plasma.enable = true;
      sddm.enable = true;
    };
    boot.grub.enable = true;
    users.angel.enable = true;
    remoteAccess.enable = true;
  };
  drivers.nvidia.enable = true;

  # Bootloader
  nix.settings.auto-optimise-store = true;
  nix.gc.automatic = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # boot.loader.grub.enable = true;
  # boot.loader.grub.device = "/dev/sda";
  # boot.loader.grub.useOSProber = true;

  # Networking
  networking.hostName = "angel";
  networking.networkmanager.enable = true; # Enable networking

  services.cron.enable = true;
  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Bluetooth
  services.blueman.enable = true;
  hardware.bluetooth.enable = true;


  # Disable Pulse audio 
  hardware.pulseaudio.enable = false;

  services.hardware.openrgb.enable = true;
  services.pipewire.wireplumber.enable = true;
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  services.pcscd.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  system.stateVersion = "23.05"; # Did you read the comment?
} 
