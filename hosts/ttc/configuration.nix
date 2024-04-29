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
    ../modules/desktop
    ../modules/packages
    ./stylix.nix
    <nixpkgs/nixos/modules/virtualisation/qemu-vm.nix>
  ];
  gaming.enable = false;
  hyprlandDesktop.enable = false;
  hacker.enable = false;
  services.displayManager.sddm.theme = "${import ./sddm-theme.nix {inherit pkgs; }}";

  nix = {
    gc.automatic = true;
    settings = {
      experimental-features = [ "nix-command" "flakes" ];
      auto-optimise-store = true;
    };
  };

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
  
  networking.hostName = "TTC";

  services.flatpak.enable = true;
  virtualisation.memorySize = 8192;
  virtualisation.cores = 4;


  programs.dconf.enable = true;
  nixpkgs.config = {
    flatpak.flathub = true;
  };
  environment.systemPackages = [
    inputs.nix-software-center.packages.${system}.nix-software-center
  ];

  users.users.ttc = {
    isNormalUser = true;
    initialPassword = "ttc";
  };
  system.stateVersion = "23.05";
}
