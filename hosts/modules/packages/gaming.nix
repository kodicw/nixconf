{ config, pkgs, ... }:
{
  programs.gamemode.enable = true;
  programs.gamescope.enable = true;
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };
  environment.systemPackages = with pkgs; [
    faudio
    r2modman
    protontricks
    winetricks
    discord
  ];
}
