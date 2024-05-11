{ modulesPath, inputs, config, lib, pkgs, ... }: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")
    inputs.disko.nixosModules.disko
    ../modules/network
    ../modules/users/charles.nix
    ../modules/packages/apps.nix
    ../modules/packages/remoteAccess.nix
    ../modules/server/nextcloud.nix
    ./disk-config.nix
  ];

  services.xserver = {
    enable = true;
    displayManager.gdm.enable = true;
    desktopManager.gnome.enable = true;
  };

  boot.loader.grub = {
    efiSupport = true;
    efiInstallAsRemovable = true;
  };

  system.stateVersion = "23.11";
}
