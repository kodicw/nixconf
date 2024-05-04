{conifg, pkgs, ...}:
{
  services.caddy = {
    enable = true;
    email = "kodicw@gmail.com";
    virtualHosts = {
      "node-nadia:80" = {
        extraConfig = ''
        reverse_proxy 100.103.153.25:8082
          '';
      };
      "100.103.153.25" = {
        extraConfig = ''
        reverse_proxy 100.103.153.25:8082
          '';
      };
    };
  };

}
