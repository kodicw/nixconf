{ config, pkgs, ... }:
{
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
}
