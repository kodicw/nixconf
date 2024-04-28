
{ config, pkgs, lib, ... }:
let
  networkAndSecurity = with pkgs; [
    linuxKernel.packages.linux_6_6.rtl88x2bu
    pass nmap
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
  nixpkgs.config.allowUnfree = true;
  security.rtkit.enable = true;
  powerManagement.cpuFreqGovernor = "performance";
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
  	
  environment.variables = {
    EDITOR = "nvim";
  };

  # Set your time zone.
  time.timeZone = "America/Los_Angeles";
  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
  services.xserver = {
    xkb.layout = "us";
  };
}
