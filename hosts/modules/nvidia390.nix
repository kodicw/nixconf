{ config, pkgs, ... }:
{
  # Nvidia GPU drivers
  environment.systemPackages = with pkgs; [
    gwe
  ];
  hardware.nvidia = {
    modesetting.enable = true;
    open = false;
    nvidiaSettings = true;
    # powerManagement.enable = true;

    package = config.boot.kernelPackages.nvidiaPackages.legacy_390;
  };
  services.xserver.videoDrivers = [ "nvidia" ];
}
