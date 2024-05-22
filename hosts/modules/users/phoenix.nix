{ config, lib, pkgs, ... }:
let
  phoenixPackages = with pkgs; [
    google-chrome
    streamdeck-ui
    obs-studio
    unityhub
    blender
  ];
  cfg = config.my.users.phoenix;
in
with lib;
{
  options = {
    my.users.phoenix.enable = mkEnableOption "Enable Phoenix";
  };
  config = mkIf cfg.enable {
    users = {
      defaultUserShell = pkgs.nushellFull;
      users = {
        Phoenix = {
          isNormalUser = true;
          description = "Boo";
          extraGroups = [ "networkmanager" "wheel" "libvertd" ];
          packages = phoenixPackages;
        };
      };
    };
  };
}
