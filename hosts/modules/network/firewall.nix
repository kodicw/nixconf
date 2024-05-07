{ config, pkgs, ... }:
{
  networking.firewall.enable = true;
  networking.firewall.trustedInterfaces = [ "tailscale0" ];
}
