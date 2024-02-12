{ config, pkgs, ... }:
{
  networking.firewall.allowedTCPPorts = [ 8000 80 7070 8069 ];
  networking.firewall.allowedUDPPorts = [ 2088 ];
  # networking.firewall.allowedUDPPortRanges = [{ from = 60000; to = 61000; }];
  networking.firewall.enable = true;
}
