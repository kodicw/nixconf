{ config, ...}:
{
  services.caddy = {
    enable = true;
    globalConfig = ''
      get_certificate tailscale
    '';
    virtualHosts."node-nadia" = {
      extraConfig = ''
        reverse_proxy localhost:8082
        '';
      };
    };
}
