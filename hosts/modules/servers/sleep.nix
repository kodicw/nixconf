{ config, lib, pkgs, ... }:
let
  cfg = config.my.servers;
in
{
  options = {
    my.servers.neverSleep = lib.mkEnableOption "Enable never sleep";
  };
  config = lib.mkIf cfg.neverSleep {
    systemd.targets.sleep.enable = false;
    systemd.targets.suspend.enable = false;
    systemd.targets.hibernate.enable = false;
    systemd.targets.hybrid-sleep.enable = false;
  };
}
