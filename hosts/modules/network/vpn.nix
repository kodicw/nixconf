{ config, pkgs, ... }:
{
  services = {
    tailscale.enable = true;
    mullvad-vpn.enable = true;
  };
}
