{ 
  config, 
  pkgs, 
  lib,
  system,
  inputs,
  ... }:
{
  imports = [
    /etc/nixos/hardware-configuration.nix
    # ../modules/desktop
    ../modules/packages
    ./stylix.nix
    inputs.stylix.nixosModules.stylix
    inputs.home-manager.nixosModules.home-manager
  ];
  myGaming.enable = false;
  # hyprlandDesktop.enable = false;
  hacker.enable = false;

  services.displayManager.sddm.theme = "${import ./sddm-theme.nix {inherit pkgs; }}";

  nix = {
    gc.automatic = true;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
  };

   home-manager.useGlobalPkgs = true;
   home-manager.useUserPackages = true;
   home-manager.users.ttc = import ./hosts/ttc/home.nix;

  system.autoUpgrade = { 
    enable = true;
    allowReboot = true;
    channel = "https://nixos.org/channels/nixos-unstable";
  };

  # boot.loader.systemd-boot.enable = true;
  # boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
  };
  
  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };
  networking.hostName = "TTC";

  services.flatpak.enable = true;


  programs.dconf.enable = true;
  nixpkgs.config = {
    flatpak.flathub = true;
  };
  environment.systemPackages = [
    inputs.nix-software-center.packages.${system}.nix-software-center
    pkgs.sddm-kcm
  ];

  users.users.ttc = {
    isNormalUser = true;
    initialPassword = "ttc";
  };
  system.stateVersion = "23.05";
}
