{ config, pkgs, lib, ... }:
let
  systemMonitoring = with pkgs; [
    btop
    neofetch
  ];

  systemCustomization = with pkgs; [
    nerdfonts
  ];

  #TODO split nix tools apart and only build for mainframee?
  utilities =
    if config.networking.hostName == "mainframe" then
      [
        pkgs.home-manager
        pkgs.nixos-anywhere
        pkgs.onefetch
        pkgs.rclone
        pkgs.nurl
        pkgs.colmena # for remote systems
      ] else [ ];


  cli =
    if config.networking.hostName == "mainframe" then
      [
        pkgs.helix
        pkgs.neovim
        pkgs.marksman
        pkgs.zellij
        pkgs.starship
        pkgs.zoxide
      ] else [
      pkgs.neovim
      pkgs.zoxide
      pkgs.tmux
    ];

  core = with pkgs; [
    binutils
    ncurses5
    zip
    unzip
    freeglut
    gparted
    ntfs3g
    git
    skate
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
