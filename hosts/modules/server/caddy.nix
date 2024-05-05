{ config, ...}:
{
  services.caddy = {
    enable = true;
    virtualHosts."node-nadia" = {
      extraConfig = ''
        reverse_proxy localhost:8082
        '';
      };
    };
}
