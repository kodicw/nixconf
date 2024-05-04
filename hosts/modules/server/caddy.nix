{conifg, pkgs, ...}:
{
  services.caddy = {
    enable = true;
    email = "kodicw@gmail.com";
    virtualHosts = {
      "virtualpotato.org:80" = {
        extraConfig = ''
        reverse_proxy :8082
          '';
      };
      "virtualpotato.org" = {
        extraConfig = ''
        reverse_proxy :8082
          '';
      };
    };
  };
  networking.firewall.allowedTCPPorts = [ 80 443];
}
