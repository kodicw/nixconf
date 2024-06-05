{ config, inputs, pkgs, ... }:
let
  big_picture = pkgs.writers.writeNuBin "big_picture" ''
    ${pkgs.steam}/bin/steam -bigpicture
  '';
  # steam_autostart = (pkgs.makeAutostartItem { name = "big_picture"; package = big_picture; });
in
{
  imports =
    [
      ../../hardware-configuration.nix
      ../modules
      inputs.stylix.nixosModules.stylix
      inputs.home-manager.nixosModules.home-manager
      ./stylix.nix
    ];

  services.xserver.desktopManager.wallpaper =
    {
      combineScreens = false;
      mode = "scale";
    };
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowBroken = true;
  programs.steam.platformOptimizations.enable = true;
  # services.pipewire.lowLatency.enable = true;


  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "steam-box"; # Define your hostname.
  networking.networkmanager.enable = true;

  # open ports for steam stream and some games
  networking.firewall.allowedTCPPorts = with pkgs.lib; [ 27036 27037 ] ++ (range 27015 27030);
  networking.firewall.allowedUDPPorts = with pkgs.lib; [ 4380 27036 ] ++ (range 27000 27031);
  networking.firewall.allowPing = false;

  environment.systemPackages = with pkgs; [
    neovim
    curl
    big_picture
    btop
    # GAMING
    steam
    # steam_autostart
    steam-run
  ];

  # Xbox controller
  boot.extraModprobeConfig = '' options bluetooth disable_ertm=1 '';

  # Gaming 32bit
  hardware.opengl.driSupport32Bit = true;
  hardware.opengl.extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
  hardware.pulseaudio.support32Bit = true;

  # Bluetooth
  hardware.bluetooth.enable = true;


  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;
  # hardware.pulseaudio.package = pkgs.pulseaudioFull;
  # hardware.pulseaudio.extraModules = [ pkgs.pulseaudio-modules-bt ];

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";
  services.xserver.videoDrivers = [ "nvidia" ];

  # Enable the KDE Desktop Environment.
  services.displayManager.sddm = {
    enable = true;
  };
  services.displayManager.autoLogin = {
    enable = true;
    user = "gamer";
  };


  services.xserver.desktopManager.plasma5.enable = true;

  # Users
  users = {
    mutableUsers = false;
    users = {
      gamer = {
        password = "";
        isNormalUser = true;
        extraGroups = [ "wheel" ]; # Enables ‘sudo’ for the user.
      };
      root.openssh.authorizedKeys.keys = [ ];
    };
  };
  home-manager.users.gamer = import ./home.nix;

  # In case nix builds are executed from that machine.

  # timezone
  time.timeZone = "America/Los_Angeles";
  systemd.extraConfig = " DefaultLimitNOFILE=1048576";
  boot.kernelPackages = pkgs.linuxPackages_latest;
  system.stateVersion = "24.05";
}




