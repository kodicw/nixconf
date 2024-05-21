{ config, pkgs, inputs, system, ... }:
let
  office = with pkgs; [
    libreoffice
    obsidian
    prusa-slicer
  ];

  multimediaTools = with pkgs; [
    vlc
    mpv
    gimp
    helvum
  ];

  terminal = with pkgs; [
    kitty
  ];

  systemMonitoring = with pkgs; [
    stacer
  ];
in
{
  services = {
    cron.enable = true;
    printing.enable = true;
  };
  environment.systemPackages =
    office ++
    terminal ++
    multimediaTools ++
    systemMonitoring;
}
