{config, pkgs, ...}:
{
  environment.etc."pass".text = "temp";
  
  services.paperless = {
    enable = true;
    address = "0.0.0.0";
    port = 9000;
    passwordFile = "/etc/pass";
    # dataDir = "/mnt/share";
    consumptionDir = "/home/charles/share";
  };
  # services.caddy = {
  #   enable = true;
  #   email = "kodicw@gmail.com";
  #   virtualHosts = {
  #     "kalamapan.com" = {
  #       extraConfig = ''
  #         reverse_proxy http://192.168.1.12:8000
  #       '';
  #     };
  #   };
  # };
}
