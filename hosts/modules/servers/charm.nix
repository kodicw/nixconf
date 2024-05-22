{ pkgs, lib, config, ... }:
let
  cfg = config.services.charm;
in
with lib;
{
  options.services.charm.enable = mkEnableOption "charm";

  config = mkIf cfg.enable {
    systemd.services.charm = {
      description = "Charm server";
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];
      serviceConfig = {
        ExecStart = "${pkgs.charm}/bin/charm serve";
      };
    };
  };
}
