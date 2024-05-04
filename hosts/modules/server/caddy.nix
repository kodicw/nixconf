{conifg, pkgs, ...}:
{
  services.caddy = {
    enable = true;
    email = "kodicw@gmail.com";
    virtualHosts = {
      "node-nadia.tail6e9f.ts.net" = {
        extraConfig = ''
        reverse_proxy node-nadia:8082
          '';
      };
    };
  };

}
