{ config, pkgs, ... }:
{
  services.tor = {
    enable = true;
  };
}
