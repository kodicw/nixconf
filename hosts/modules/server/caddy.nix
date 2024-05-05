{conifg, pkgs, ...}:
{
  services.caddy = {
    enable = true;
    email = "kodicw@gmail.com";
    virtualHosts = {
      "192.168.1.12" = {
        extraConfig = ''
        reverse_proxy 192.168.1.12:8082
          '';
      };
    };
  };
  networking.firewall.allowedTCPPorts = [ 443 80];
}
