{ config, pkgs, ... }:
let
  web = with pkgs; [
    chromium
  ];
in
{
  home.packages =
    web;
  home.stateVersion = "24.05";
  home.file = {
    ".background-image".source = ./background.jpg;
  };
}
