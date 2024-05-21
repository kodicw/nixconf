{ pkgs, config, lib, ... }:
let
  cfg = config.myPlasma;
in
with lib;
{
  options = {
    myPlasma.enable = mkEnableOption "Plasma Desktop";
  };
  config = mkIf cfg.enable {
    services.xserver = {
      enable = true;
      desktopManager.plasma5.enable = true;
    };
  };
}
