{ config, pkgs, lib, ... }:
let
  cfg = config.my.servers.photoprism;
in
with lib;
{
  options = {
    my.servers.photoprism.enable = mkEnableOption "Photoprism";
  };
  config = mkIf cfg.enable
    {
      services.photoprism = {
        enable = true;
        port = 2342;
        originalsPath = "/var/lib/private/photoprism/originals";
        address = "0.0.0.0";
        settings = {
          PHOTOPRISM_ADMIN_USER = "admin";
          # PHOTOPRISM_ADMIN_PASSWORD = "temp123";
          PHOTOPRISM_DEFAULT_LOCALE = "en";
          PHOTOPRISM_UPLOAD_NSFW = "true";
        };
      };
      networking.firewall.allowedTCPPorts = [ 2342 ];
    };
}
