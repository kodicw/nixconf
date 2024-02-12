{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    docker
    lazydocker
    virt-manager
    win-virtio
  ];
  virtualisation = {
    waydroid = {
      enable = true;
    };
    docker = {
      enable = true;
    };
    libvirtd = {
      enable = true;
      qemu = {
        swtpm = {
          enable = true;
        };
      };
      allowedBridges = [ "virbr0" ];
    };
  };
}

