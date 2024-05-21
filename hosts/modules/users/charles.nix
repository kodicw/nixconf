{ pkgs, ... }:
let
  groups = [
    "networkmanager"
    "wheel"
    "libvirtd"
    "docker"
    "audio"
    "dialout"
  ];
in
{
  users = {
    defaultUserShell = pkgs.nushellFull;
    users = {
      charles = {
        isNormalUser = true;
        useDefaultShell = true;
        initialPassword = "password";
        description = "charles";
        extraGroups = groups;
        packages = with pkgs; [
          starship
        ];
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICiDe2CMnDgWjXqMpQHxCSOmrjuAWwZazYPORZXlr2SF u0_a518@localhost"
          "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDEDbKoprxQnwISBW5IbabX4rEBXKprqgfO4BQUOEpt5BrdK3/y6777Mr0lopPBQTp5S/pd5BEWcSv3XGb3llcTQRjJpH6/SHzlATVn0fwCT7wXu7P5S82zGizxAeilVoS8aTa4/38CvKikcKDtvZErNyanHlGvkohf4kOV8QcOORy8t4BdH6epbVtTZKqCe9T0tafdP+upLbnWGiu4EzHkYYu+uMRuWYrBS+kimMpuQkULsjUOhv1rsQ9kEtbsAanM+ZPMizqsHE2S0d8VyZkeNysVBTGVSCUx45zif+kdVUCH5X3n6DY7QDiPn+aAOMVP9ZaubNzM3lv+I9+JB7n+W6NGQ2ONBbTFaBR6MihpIgPVaVvUxq/Edy+iAd0tk51esCxd52LUZn/UaIBjDR2XlIobgT1yngzaJ+8CAB1xaTeXRGEBivh8yNnsRlJTg0U+4e51jo8s+0WrmG3fgZIC9NJO07Zg3ztxJPz+x306oOWpQb8XStWnMhBL+BoS2X0= charles@r2
"
        ];
      };
    };
  };
}
