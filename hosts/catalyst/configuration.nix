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
    ../modules # imports my set of modules
    ./stylix.nix
    inputs.stylix.nixosModules.stylix
    inputs.home-manager.nixosModules.home-manager
  ];

  my = {
    boot.grub.enable = true;
    users.jujabes.enable = true;
    desk.gnome.enable = true;
    nix = {
      settings.enable = true;
      appStore.enable = true;
    };
    servers = {
      xrdp.enable = true;
      nextcloud.enable = true;
      neverSleep = true;
    };
  };

  drivers.nvidia.enable = true;

  services.openssh = {
    enable = true;
    settings.PasswordAuthentication = true;
    settings.KbdInteractiveAuthentication = false;
    # settings.PermitRootLogin = "no";  
  };
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.jujabes = import ./home.nix;

  networking.hostName = "catalyst";

  environment.systemPackages = [
    inputs.nix-software-center.packages.${system}.nix-software-center
  ];

  system.stateVersion = "23.05";
}

