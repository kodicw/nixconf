{ config, pkgs, ... }:
{
  services = {
    tailscale = {
      enable = true;
      openFirewall = true;
    };
    mullvad-vpn.enable = true;
  };
}
