{ config, pkgs, lib, ... }:
let
  gameApps = with pkgs; [
    discord
    protontricks
    winetricks
    faudio
    r2modman
    wine
    bottles
    steamtinkerlaunch
  ];
in
{
  options = {
    myGaming.enable = lib.mkEnableOption "Add packages for gaming on linux";
  };
  config = lib.mkIf config.myGaming.enable {
    services.hardware.openrgb.enable = true;
    programs = {
      gamemode.enable = true;
      gamescope.enable = true;
      steam = {
        enable = true;
        remotePlay.openFirewall = true;
        dedicatedServer.openFirewall = true;
      };
    };
    environment.systemPackages = gameApps;
  };
}
