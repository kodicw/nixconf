{config, pkgs, ...}:
let
  devEnvironment = with pkgs; [
    vscode
    minicom
    thonny
    cura
  ];
  programingLanguages = with pkgs; [
    clang
    python311
    ruby
    nodejs_20
    bun
    zig
    go
  ];

  designMediaTools = with pkgs; [
    blender
    krita
    kdenlive
  ];
  web = with pkgs; [
    google-chrome
  ];
in
{
  home.packages = 
    devEnvironment ++ 
    programingLanguages ++
    web ++
    designMediaTools;
  home.stateVersion = "23.05";
}
