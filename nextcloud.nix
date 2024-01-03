{config, pkgs, ... }:
{
  environment.etc."nextcloud-pass-file".text = "test123";
  services.nextcloud = {
    enable = true;
    hostName = "localhost";
    package = pkgs.nextcloud27;
    home = "/var/nextcloud";
    appstoreEnable = true;
    extraApps = with config.services.nextcloud.package.packages.apps; {
      inherit contacts calendar tasks;
    };
    extraAppsEnable = true;
    config = {
      adminpassFile = "/etc/nextcloud-pass-file";
      adminuser = "anthony";
      };
  };
}
