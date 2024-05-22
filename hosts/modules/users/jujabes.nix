{ config, pkgs, lib, ... }:
let
  groups = [
    "networkmanager"
    "wheel"
    "libvirtd"
    "docker"
    "audio"
    "dialout"
  ];
  cfg = config.my.users.jujabes;
in
with lib;
{
  options = {
    my.users.jujabes.enable = mkEnableOption "Enable user jujabes";
  };
  config = mkIf cfg.enable {
    users = {
      defaultUserShell = pkgs.nushellFull;
      users = {
        jujabes = {
          isNormalUser = true;
          useDefaultShell = true;
          initialPassword = "password";
          description = "jujabes";
          extraGroups = groups;
        };
      };
    };
  };
}
