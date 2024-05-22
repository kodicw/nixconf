{ config, lib, pkgs, ... }:
let
  cfg = config.my.desk.gnome;
in
with lib;
{
  options = {
    my.desk.gnome.enable = mkEnableOption "Enable GNOME desktop environment";
  };
  config = mkIf cfg.enable {
    services.xserver = {
      enable = true;
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };
  };
}
 
