{conifg, pkgs, ...}:
{
  services.caddy = {
    enable = true;
    email = "kodicw@gmail.com";
    virtualHosts = {
      "node-nadia" = {
        extraConfig = ''
        reverse_proxy 127.0.0.1:8082
          '';
      };
    };
  };

}
