{conifg, pkgs, ...}:
{
  services.caddy = {
    enable = true;
    email = "kodicw@gmail.com";
    virtualHosts = {
      "virtualpotato.org" = {
        extraConfig = ''
        reverse_proxy 100.103.153.25:8082
          '';
      };
    };
  };
  networking.firewall.allowedTCPPorts = [ 443 80];
}
