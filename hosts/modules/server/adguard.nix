{ config, pkgs, ... }:
{
  services.adguardhome = {
    enable = true;
    mutableSettings = true;
    openFirewall = true;
    settings = {
      bind_host = "0.0.0.0";
      bind_port = 8000;
    };
  };
}
