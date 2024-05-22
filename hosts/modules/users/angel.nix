{ config, pkgs, lib, ... }:
let
  cfg = config.my.users.angel;
in
with lib;
{
  options = {
    my.users.angel.enable = mkEnableOption "Enable angel's user configuration";
  };
  config = mkIf cfg.enable {
    users = {
      defaultUserShell = pkgs.nushellFull;
      users = {
        angel = {
          isNormalUser = true;
          description = "angel";
          packages = with pkgs; [
            google-chrome
          ];
        };
      };
    };
  };
}
