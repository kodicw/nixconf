{conifg, pkgs, ...}:
{
  services.traefik = {
    enable = true;
  };
  # services.caddy = {
  #   enable = true;
  #   email = "kodicw@gmail.com";
  #   virtualHosts = {
  #     "virtualpotato.org" = {
  #       extraConfig = ''
  #       reverse_proxy 192.168.1.12:8082
  #         '';
  #     };
  #   };
  # };
  # networking.firewall.allowedTCPPorts = [ 443 80];
}
