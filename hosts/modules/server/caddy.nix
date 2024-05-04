{conifg, pkgs, ...}:
{
  services.caddy = {
    enable = true;
    email = "kodicw@gmail.com";
    virtualHosts = {
      "node-nadia" = {
        extraConfig = ''
        reverse_proxy node-nadia:8082
          '';
      };
    };
  };

}
