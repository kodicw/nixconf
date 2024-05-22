{ config, pkgs, lib, ... }:
let
  cfg = config.my.servers.nextcloud;
in
with lib;
{
  options = {
    my.servers.nextcloud.enable = mkEnableOption "Enable Nextcloud";
  };
  config = mkIf cfg.enable {
    environment.etc."nextcloud-admin-pass".text = "password";
    services.nextcloud = {
      enable = true;
      package = pkgs.nextcloud28;
      hostName = "localhost";
      config.adminpassFile = "/etc/nextcloud-admin-pass";
    };
  };
}
