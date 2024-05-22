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
    ../modules
    ./stylix.nix
    inputs.stylix.nixosModules.stylix
    inputs.home-manager.nixosModules.home-manager
  ];

  my = {
    nix = {
      settings.enable = true;
      appStore.enable = true;
    };
    desk.gnome.enable = true;
    boot.grub.enable = true;
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.ttc = import ./home.nix;

  networking.hostName = "ttc";

  users.users.ttc = {
    isNormalUser = true;
    initialPassword = "ttc";
  };

  system.stateVersion = "23.05";
}
