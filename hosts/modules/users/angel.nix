{ config, pkgs, ... }:
{
  users = {
    defaultUserShell = pkgs.nushellFull;
    users = {
      Angel = {
        isNormalUser = true;
        description = "Angel";
        packages = with pkgs; [
          google-chrome
        ];
      };
    };
  };
}
