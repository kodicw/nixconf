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
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };
  services.xserver.videoDrivers = [ "nvidia" ];
}
