{ config, pkgs, ... }:
{
  services.xserver = {
    displayManager.sddm.enable = true;
    desktopManager.plasma6.enable = true;
  };
}
