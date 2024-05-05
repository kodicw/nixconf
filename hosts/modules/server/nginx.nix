{ config, ...}:
{
  services.nginx = {
      enable = true;
      recommendedGzipSettings = true;
      recommendedOptimisation = true;
      recommendedProxySettings = true;
      recommendedTlsSettings = true;
      sslCiphers = "AES256+EECDH:AES256+EDH:!aNULL";
      appendHttpConfig = ''
      map $scheme $hsts_header {
          https   "max-age=31536000; includeSubdomains; preload";
      }
      add_header Strict-Transport-Security $hsts_header;
      add_header 'Referrer-Policy' 'origin-when-cross-origin';
      add_header X-Frame-Options DENY;
      add_header X-Content-Type-Options nosniff;
      proxy_cookie_path / "/; secure; HttpOnly; SameSite=strict";
      '';
      virtualHosts."virtualpotato.com" =  {
        enableACME = true;
        forceSSL = true;
        locations."/" = {
          proxyPass = "http://127.0.0.1:8082";
          proxyWebsockets = true;
          # extraConfig =
          #   "proxy_ssl_server_name on;" +
          #   "proxy_pass_header Authorization;"
          #   ;
        };
      };
  };
  networking.firewall.allowedTCPPorts = [80 443];
  security.acme = {
  acceptTerms = true;
  defaults.email = "kodicw@gmail.com";
};
}
