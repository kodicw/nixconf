{ config, pkgs, ... }:
{
  users = {
    defaultUserShell = pkgs.nushell;
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
