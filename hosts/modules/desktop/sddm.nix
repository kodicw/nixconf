{ config, system, lib, ... }:
let
  cfg = config.my.desk.sddm;
in
with lib;
{
  options = {
    my.desk.sddm.enable = mkEnableOption "Enable SDDM";
  };
  config = mkIf cfg.enable {
    services.xserver.enable = true;
    services.displayManager.sddm.enable = true;
    # services.displayManager.sddm.theme = "${import ./sddm-theme.nix {inherit pkgs; }}";
    # environment.systemPackages = [ pkgs.sddm-kcm ];
  };
}
