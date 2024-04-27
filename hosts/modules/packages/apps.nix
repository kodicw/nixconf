
{ config, pkgs, lib, ... }:
let
  networkAndSecurity = with pkgs; [
    linuxKernel.packages.linux_6_6.rtl88x2bu
    pass
  ];
	
  systemMonitoring = with pkgs; [
    nvtopPackages.full
    btop neofetch
  ];
	
  systemCustomization = with pkgs; [
    nerdfonts pywal
  ];
	
  utilities = with pkgs; [
    rpi-imager
    swaynotificationcenter
    home-manager
    rclone
    nurl
  ];

  cli = with pkgs; [
    helix neovim 
    marksman zellij starship
  ];

  core = with pkgs; [
    binutils ncurses5
    zip unzip freeglut
    gparted ntfs3g
    wl-clipboard
  ];

  artificialIntelligence = with pkgs; [
    ollama piper-tts
  ];
in
{
  security.rtkit.enable = true;
  # Install Applications
  environment.systemPackages = 
    networkAndSecurity ++ 
    systemMonitoring ++ 
    systemCustomization ++ 
    artificialIntelligence ++
    core ++ 
    cli ++
    utilities;

  programs = {
    nh.enable = true;
  };
  	
   environment.sessionVariables = {
    EDITOR = "nvim";
  };
}
