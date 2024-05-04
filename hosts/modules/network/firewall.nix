{ config, pkgs, ... }:
{
  # networking.firewall.allowedTCPPorts = [ 8000 80 7070 8069 ];
  networking.firewall.allowedTCPPorts = [443];
  # networking.firewall.allowedUDPPorts = [ 2088 ];
  networking.firewall.enable = true;
  networking.firewall.trustedInterfaces = [ "tailscale0" ];

}
