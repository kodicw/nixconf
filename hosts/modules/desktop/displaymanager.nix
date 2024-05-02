{ config, pkgs, system, ... }:
{
  services.xserver = {
    enable = true;
    desktopManager.plasma5.enable = true;
  };
  services.displayManager.sddm.enable = true;
  services.displayManager.sddm.theme = "${import ./sddm-theme.nix {inherit pkgs; }}";
  environment.systemPackages = [pkgs.sddm-kcm];
}
