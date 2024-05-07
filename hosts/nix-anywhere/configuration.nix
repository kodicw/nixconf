{ modulesPath, config, lib, pkgs, ... }: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
    (modulesPath + "/profiles/qemu-guest.nix")
    ../modules/networking
    ../modules/users/charles.nix
    ../modules/packages/apps.nix
    ../modules/packages/remoteAccess.nix
    ../modules/server/nextcloud.nix
    ./disk-config.nix
  ];
  boot.loader.grub = {
    efiSupport = true;
    efiInstallAsRemovable = true;
  };

  system.stateVersion = "23.11";
}
