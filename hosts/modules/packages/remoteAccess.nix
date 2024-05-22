{ config, pkgs, lib, ... }:
let
  cfg = config.my.remoteAccess;
in
{
  options = {
    my.remoteAccess.enable = lib.mkEnableOption "Enable remote access";
  };
  config = lib.mkIf cfg.enable {
    services.openssh = {
      enable = true;
      settings.PasswordAuthentication = false;
      settings.KbdInteractiveAuthentication = false;
      # settings.PermitRootLogin = "no";  
    };
    programs.mosh.enable = true;
    environment.systemPackages = with pkgs; [ ];
    users.users.root.openssh.authorizedKeys.keys = [
      "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDEDbKoprxQnwISBW5IbabX4rEBXKprqgfO4BQUOEpt5BrdK3/y6777Mr0lopPBQTp5S/pd5BEWcSv3XGb3llcTQRjJpH6/SHzlATVn0fwCT7wXu7P5S82zGizxAeilVoS8aTa4/38CvKikcKDtvZErNyanHlGvkohf4kOV8QcOORy8t4BdH6epbVtTZKqCe9T0tafdP+upLbnWGiu4EzHkYYu+uMRuWYrBS+kimMpuQkULsjUOhv1rsQ9kEtbsAanM+ZPMizqsHE2S0d8VyZkeNysVBTGVSCUx45zif+kdVUCH5X3n6DY7QDiPn+aAOMVP9ZaubNzM3lv+I9+JB7n+W6NGQ2ONBbTFaBR6MihpIgPVaVvUxq/Edy+iAd0tk51esCxd52LUZn/UaIBjDR2XlIobgT1yngzaJ+8CAB1xaTeXRGEBivh8yNnsRlJTg0U+4e51jo8s+0WrmG3fgZIC9NJO07Zg3ztxJPz+x306oOWpQb8XStWnMhBL+BoS2X0= charles@r2"
    ];
  };
}
