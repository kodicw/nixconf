{ config, pkgs, ... }:
let 
  phoenixPackages = with pkgs; [
    google-chrome 
    streamdeck-ui
    obs-studio unityhub
    blender
  ];
in
{
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
}
