{ config, pkgs, ... }:
{
  services.octoprint = {
    openFirewall = true;
    enable = true;
    port = 8383;
  };
}
