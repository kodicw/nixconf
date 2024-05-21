{ config, pkgs, ... }:
{
  networking.firewall.allowedTCPPorts = [ 2342 22 9000 8080 80 8123 443 8000 53 8384 22000 ];
  networking.firewall.allowedUDPPorts = [ 2088 53 22000 21027 ];
  networking.firewall.allowedUDPPortRanges = [{ from = 60000; to = 61000; }];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;
}
