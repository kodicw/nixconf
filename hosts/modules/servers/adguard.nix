{ config, pkgs, lib, ... }:
let
  cfg = config.my.servers.adguardHome;
in
with lib;
{
  options = {
    my.servers.adguardHome.enable = mkEnableOption "Enable Adguard Home";
  };
  config = mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      adguardian
    ];
    services.adguardhome = {
      enable = true;
      mutableSettings = true;
      openFirewall = true;
      settings = {
        bind_host = "0.0.0.0";
        bind_port = 8000;
      };
    };
  };
}
