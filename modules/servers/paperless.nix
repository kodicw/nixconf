{ config, pkgs, ... }:
# Paperless-ng config
{
  services.paperless = {
    enable = true;
    port = 7272;
    extraConfig.PAPERLESS_AUTO_LOGIN_USERNAME = "admin";
  };
}
