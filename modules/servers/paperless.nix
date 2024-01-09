{ config, pkgs, ... }:
# Paperless-ng config
{
  services.paperless = {
    enable = true;
    port = 7272;
    passwordFile = "/etc/pass";
  };
  environment.etc."pass".text = "1234";
}
