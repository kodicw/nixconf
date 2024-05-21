{ config, system, lib, ... }:
let
  cfg = config.mySddm;
in
with lib;
{
  options = {
    mySddm.enable = mkEnableOption "Enable SDDM";
  };
  config = mkIf cfg.enable {
    services.xserver.enable = true;
    services.displayManager.sddm.enable = true;
    # services.displayManager.sddm.theme = "${import ./sddm-theme.nix {inherit pkgs; }}";
    # environment.systemPackages = [ pkgs.sddm-kcm ];
  };
}
