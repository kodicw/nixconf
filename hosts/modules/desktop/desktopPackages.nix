{config, pkgs, inputs, system, ...}:
let
  office = with pkgs; [
    libreoffice obsidian
    bitwarden prusa-slicer
    inputs.nix-software-center.packages.${system}.nix-software-center
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
  services = {
    cron.enable = true;
    printing.enable = true;
  };
  environment.systemPackages = 
    office ++ 
    terminal ++ 
    webBrowsers ++ 
    multimediaTools ++
    cosmicApplications ++ 
    systemMonitoring;
}
