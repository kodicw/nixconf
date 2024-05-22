{ config
, pkgs
, lib
, system
, inputs
, ...
}:

{
  imports = [
    /etc/nixos/hardware-configuration.nix
    ../modules/desktop
    ../modules/packages
    ../modules/server
    ./stylix.nix
    inputs.stylix.nixosModules.stylix
    inputs.home-manager.nixosModules.home-manager
  ];
  myGaming.enable = false;
  hacker.enable = false;
  my.nextcloud.enable = true;
  my.xrdp = {
    enable = true;
  };

  nix = {
    gc.automatic = true;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.jujabes = import ./home.nix;

  system.autoUpgrade = {
    enable = true;
    allowReboot = true;
    channel = "https://nixos.org/channels/nixos-unstable";
  };

  boot.loader = {
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      efiSupport = true;
      device = "/dev/sda";
    };
  };

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };
  networking.hostName = "catalyst";

  services.flatpak.enable = true;

  programs.dconf.enable = true;

  nixpkgs.config = {
    flatpak.flathub = true;
  };

  environment.systemPackages = [
    inputs.nix-software-center.packages.${system}.nix-software-center
  ];

  users.users.jujabes = {
    isNormalUser = true;
    initialPassword = "password";
  };

  system.stateVersion = "23.05";
}

