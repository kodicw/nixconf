
{ config, pkgs, lib, ... }:
let
  systemMonitoring = with pkgs; [
    btop neofetch
  ];
	
  systemCustomization = with pkgs; [
    (nerdfonts.override {fonts = [ "BigBlueTerm"];})
  ];
	
  utilities = with pkgs; [
    home-manager
    nixos-anywhere
    rclone
    nurl
    git
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
in
{
  nixpkgs.config.allowUnfree = true;
  security.rtkit.enable = true;
  powerManagement.cpuFreqGovernor = "performance";
  # Install Applications
  environment.systemPackages = 
    systemMonitoring ++ 
    systemCustomization ++ 
    core ++ 
    cli ++
    utilities;

  programs = {
    nh.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
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
