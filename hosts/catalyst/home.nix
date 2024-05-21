{ config, pkgs, ... }:
let
  devEnvironment = with pkgs; [
    vscode
  ];
  programingLanguages = with pkgs; [
    python311
    bun
  ];

  web = with pkgs; [
    google-chrome
  ];
in
{
  home.packages =
    devEnvironment ++
    programingLanguages ++
    web;
  home.stateVersion = "23.05";
}
