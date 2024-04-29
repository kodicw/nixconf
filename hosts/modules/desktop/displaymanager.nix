{ config, pkgs, system, ... }:
{
  services.xserver = {
    enable = true;
    desktopManager.plasma5.enable = true;
  };
  services.displayManager.sddm.enable = true;
}
