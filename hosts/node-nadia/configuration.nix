{ config, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ../modules/server
      ./modules/networking
      # ../modules/desktop
      ../modules/users/charles.nix
      ../modules/packages
      ../modules/nvidia.nix
    # <nixpkgs/nixos/modules/virtualisation/qemu-vm.nix>
    ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader = {
    grub.enable = true;
    grub.device = "/dev/sda";
    grub.useOSProber = true;
  };

  networking = {
    hostName = "node-nadia";
    networkmanager.enable = true;
  };

  services.tailscale = {
    enable = true;
    useRoutingFeatures = "both";
  };

  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  programs.light.enable = true;

  users.users.root.openssh.authorizedKeys.keys = [
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDEDbKoprxQnwISBW5IbabX4rEBXKprqgfO4BQUOEpt5BrdK3/y6777Mr0lopPBQTp5S/pd5BEWcSv3XGb3llcTQRjJpH6/SHzlATVn0fwCT7wXu7P5S82zGizxAeilVoS8aTa4/38CvKikcKDtvZErNyanHlGvkohf4kOV8QcOORy8t4BdH6epbVtTZKqCe9T0tafdP+upLbnWGiu4EzHkYYu+uMRuWYrBS+kimMpuQkULsjUOhv1rsQ9kEtbsAanM+ZPMizqsHE2S0d8VyZkeNysVBTGVSCUx45zif+kdVUCH5X3n6DY7QDiPn+aAOMVP9ZaubNzM3lv+I9+JB7n+W6NGQ2ONBbTFaBR6MihpIgPVaVvUxq/Edy+iAd0tk51esCxd52LUZn/UaIBjDR2XlIobgT1yngzaJ+8CAB1xaTeXRGEBivh8yNnsRlJTg0U+4e51jo8s+0WrmG3fgZIC9NJO07Zg3ztxJPz+x306oOWpQb8XStWnMhBL+BoS2X0= charles@r2"
  ];

  system.stateVersion = "23.05"; 
} 

 
