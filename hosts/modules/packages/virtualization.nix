{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    docker
    lazydocker
    virt-manager
    win-virtio
  ];


  virtualisation = {
    waydroid.enable = true;
    docker.enable = true;

    libvirtd = {
      enable = true;
      qemu.swtpm.enable = true;
      allowedBridges = [ "virbr0" ];
    };
  };
  virtualisation.vmVariant = {
    imports = [ <nixpkgs/nixos/modules/virtualisation/qemu-vm.nix> ];
    virtualisation.memorySize = 8192;
    virtualisation.cores = 4;
    virtualisation.diskSize = 20000;
  };
}

