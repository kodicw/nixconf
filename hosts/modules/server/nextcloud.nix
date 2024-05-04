{ config, pkgs, ... }:
{
  # environment.etc."nextcloud-admin-pass".text = "PWD";
  # services.nextcloud = {
  #   enable = true;
  #   package = pkgs.nextcloud28;
  #   hostName = "localhost";
  #   config.adminpassFile = "/etc/nextcloud-admin-pass";
  # };
  services.caddy.enable = true;
  services.caddy.virtualHosts."localhost" = {
    extraConfig = ''
    reverse_proxy node-nadia:8082
    '';
  };

#   security.acme = {
#     acceptTerms = true;   
#     certs = { 
#       ${config.services.nextcloud.hostName}.email = "kodicw@gmail.com"; 
#   }; 
# };
}
