{ config, pkgs, ... }:
{
  services.xserver = {
    desktopManager.plasma5.enable = true;
  };
  services.displayManager.sddm.enable = true;
}
