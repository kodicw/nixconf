{conifg, pkgs, ...}:
{
  services.caddy = {
    enable = true;
    email = "kodicw@gmail.com";
    virtualHosts = {
      "node-nadia.kodicw.gmail.com.beta.tailscale.net" = {
        extraConfig = ''
        reverse_proxy 127.0.0.1:8082
          '';
      };
    };
  };

}
