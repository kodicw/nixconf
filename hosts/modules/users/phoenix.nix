{ config, pkgs, ... }:
{
  users = {
    defaultUserShell = pkgs.nushellFull;
    users = {
      Phoenix = {
        isNormalUser = true;
        description = "Boo";
        extraGroups = [ "networkmanager" "wheel" "libvertd" ];
        packages = with pkgs; [
          google-chrome
          vivaldi
          streamdeck-ui
          ytfzf
          instaloader
          vlc
          obs-studio
        ];
      };
    };
  };
}
