{ config, pkgs, lib, ... }:
let
  cfg = config.drivers.nvidia;
in
{
  options = {
    drivers.nvidia.enable = lib.mkEnableOption "Enable Nvidia drivers";
  };
  config = lib.mkIf cfg.enable {
    # Nvidia GPU drivers
    environment.systemPackages = with pkgs; [
      gwe
    ];
    hardware.nvidia = {
      modesetting.enable = true;
      open = false;
      nvidiaSettings = true;
      # powerManagement.enable = true;

      package = config.boot.kernelPackages.nvidiaPackages.beta;
    };
    services.xserver.videoDrivers = [ "nvidia" ];
  };
}
