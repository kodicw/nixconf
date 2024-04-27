{ config, pkgs, ... }:
{
  imports =
    [
      /etc/nixos/hardware-configuration.nix
      ../modules/users
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

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  powerManagement.cpuFreqGovernor = "performance";

  # Networking
  networking = {
    hostName = "mainframe";
    networkmanager.enable = true;
  };

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";
  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;
  system.autoUpgrade.channel = "https://nixos.org/channels/nixos-unstable";

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  # Enable Cronjob service
  services.cron.enable = true;
  # Enable CUPS to print documents.
  services.printing.enable = true;


  hardware.pulseaudio.enable = false;

  services.xserver = {
    xkb.layout = "us";
  };

  services.hardware.openrgb.enable = true;
  services.pipewire.wireplumber.enable = true;
  nixpkgs.config.allowUnfree = true;

  services.pcscd.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };


  system.stateVersion = "23.05"; # Did you read the comment?
} 
