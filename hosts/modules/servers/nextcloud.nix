{ config, pkgs, lib, ... }:
let
  cfg = config.my.servers.nextcloud;
in
with lib;
{
  options = {
    my.servers.nextcloud = {
      enable = mkEnableOption "Enable Nextcloud";
      hostName = mkOption {
        type = types.str;
        default = "localhost";
        description = "The hostname of the Nextcloud server";
      };
      trusted_domains = mkOption {
        type = types.listOf types.str;
        default = [ "localhost" ];
        description = "List of trusted domains for Nextcloud";
      };
    };
  };

  config = mkIf cfg.enable {
    environment.etc."nextcloud-admin-pass".text = "password";
    services.nextcloud = {
      enable = true;
      package = pkgs.nextcloud28;
      hostName = cfg.hostName;
      settings.trusted_domains = cfg.trusted_domains;
      appstoreEnable = true;
      config.adminpassFile = "/etc/nextcloud-admin-pass";
    };
  };
}
