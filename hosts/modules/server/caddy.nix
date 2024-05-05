{ config, ...}:
{
  services.caddy = {
    enable = true;
    virtualHosts."node-nadia.tail6e9f.ts.net" = {
      extraConfig = ''
        reverse_proxy localhost:8082
        '';
      };
    };
}
