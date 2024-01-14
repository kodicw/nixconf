{ config, pkgs, lib, ... }:
let
  unstable = import
    (builtins.fetchTarball {
      url = "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz";
    })
    { config = config.nixpkgs.config; };
  nix-software-center = import
    (pkgs.fetchFromGitHub {
      owner = "snowfallorg";
      repo = "nix-software-center";
      rev = "0.1.2";
      sha256 = "xiqF1mP8wFubdsAQ1BmfjzCgOD3YZf7EGWl9i69FTls=";
    })
    { pkgs = unstable; };
in
{
  imports = [
    <home-manager/nixos>
    /etc/nixos/hardware-configuration.nix
  ];
  services.xserver.enable = true;
  services.xserver.displayManager = {
    gdm.enable = true;
  };
  services.xserver.desktopManager.gnome.enable = true;


  services.flatpak.enable = true;

  # Adds flathub as flatpak package repository
  nixpkgs.config = {
    flatpak.flathub = true;
  };

  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
  ]) ++ (with pkgs.gnome; [
    cheese # webcam tool
    gnome-music
    gnome-terminal
    gedit # text editor
    epiphany # web browser
    geary # email reader
    evince # document viewer
    gnome-characters
    totem # video player
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
  ]);

  environment.systemPackages = with pkgs; [
    nix-software-center
    flatpak
    bottles
    gnome.gnome-software
  ];
  users.users.ttc.isNormalUser = true;
  home-manager.users.ttc = { pkgs, ... }: {
    home.packages = with pkgs; [
      python311
      prusa-slicer
    ];
    programs.bash.enable = true;
    home.stateVersion = "23.11";
  };
  system.stateVersion = "23.11";
}
