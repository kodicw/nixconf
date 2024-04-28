{ config, pkgs, ... }:
{
  services.xserver = {
    enable = true;
    desktopManager.plasma5.enable = true;
  };
  services.displayManager.sddm.enable = true;
  environment.systemPackages = with pkgs; [
      cosmic-edit
      cosmic-files
  ];
}
