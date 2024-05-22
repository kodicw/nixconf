{ pkgs, config, lib, ... }:
let
  cfg = config.my.desk.plasma;
in
with lib;
{
  options = {
    my.desk.plasma.enable = mkEnableOption "Plasma Desktop";
  };
  config = mkIf cfg.enable {
    services.xserver = {
      enable = true;
      desktopManager.plasma5.enable = true;
    };
  };
}
