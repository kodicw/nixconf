{ pkgs, config, lib, ... }:
let
  cfg = config.my.xrdp;
in
with lib;
{
  options = {
    my.xrdp = {
      enable = mkEnableOption "Enable xrdp";
      port = mkOption {
        type = types.port;
        default = 3389;
        description = "Port to listen on";
      };
    };
  };
  config = mkIf cfg.enable {
    services.xrdp = {
      enable = true;
      port = cfg.port;
      openFirewall = true;
      defaultWindowManager = "/run/current-system/sw/bin/gnome-session";
    };
  };
}
