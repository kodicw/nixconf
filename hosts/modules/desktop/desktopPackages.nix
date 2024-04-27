{config, pkgs, ...}:
let
  office = with pkgs; [
    libreoffice obsidian
    bitwarden orca-slicer
  ];

  multimediaTools = with pkgs; [
    vlc mpv gimp helvum
    obs-studio
  ];

  terminal = with pkgs; [
    kitty 
  ];

  cosmicApplications = with pkgs; [
    cosmic-term
    cosmic-edit
    cosmic-files
  ];

  systemMonitoring = with pkgs; [
    stacer
  ];

  webBrowsers = with pkgs; [
    vivaldi tor-browser-bundle-bin
  ];
in
{
  environment.systemPackages = 
    office ++ 
    terminal ++ 
    webBrowsers ++ 
    multimediaTools ++
    cosmicApplications ++ 
    systemMonitoring;
}
