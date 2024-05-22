{ pkgs, config, lib, ... }:
let
  cfg = config.my.servers.xrdp;
in
with lib;
{
  options = {
    my.servers.xrdp = {
      enable = mkEnableOption "Enable xrdp";
      port = mkOption {
        type = types.port;
        default = 3389;
        description = "Port to listen on";
      };
      wm = mkOption {
        type = types.str;
        default = "gnome-remote-desktop";
        description = "Window manager to use";
      };
      config = config.services.xrdp;
    };
  };
  config = mkIf cfg.enable {
    services.xrdp = {
      enable = true;
      port = cfg.port;
      openFirewall = true;
      defaultWindowManager = cfg.wm;
    };
  };
}
