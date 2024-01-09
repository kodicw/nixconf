{ config, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ./apps.nix
      ./hyprland.nix
      ./users.nix
      ./dev.nix
      ./server.nix
      ./remote.nix
      ./odoo.nix
      #./modules/servers/paperless.nix
    ];
  # Bootloader
  nix.settings.auto-optimise-store = true;
  nix.gc.automatic = true;
  boot.loader.systemd-boot.enable = true;
  boot.loader.grub.theme = pkgs.nixos-grub2-theme;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking
  networking.hostName = "mainframe";

  # Enable networking
  networking.networkmanager.enable = true;
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


  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.videoDrivers = [ "nvidia" ];
  # Enable Cronjob service
  services.cron.enable = true;
  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Bluetooth
  services.blueman.enable = true;
  hardware.bluetooth.enable = true;


  # services.network-manager-applet.enable = true;

  # Enable Wayland compositor Sway
  # xdg.portal = { enable = true; extraPortals = [ pkgs.xdg-desktop-portal-gtk ]; };
  # If you want to use JACK applications, uncomment this

  # Nvidia GPU drivers
  hardware.nvidia = {
    # Modesetting is needed for most Wayland compositors
    modesetting.enable = true;
    # Use the open source version of the kernel module
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    #package = (config.boot.kernelPackages.nvidiaPackages.stable.overrideAttrs {
    #src = pkgs.fetchurl {
    #url = "https://download.nvidia.com/XFree86/Linux-x86_64/525.125.06/NVIDIA-Linux-x86_64-525.125.06.run";
    #sha256 = "17av8nvxzn5af3x6y8vy5g6zbwg21s7sq5vpa1xc6cx8yj4mc9xm";
    #};
    #});
  };

  # Disable Pulse audio 
  hardware.pulseaudio.enable = false;

  # Nix experimental 
  nix.settings.experimental-features = [ "nix-command" "flakes" ];


  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };


  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  services.hardware.openrgb.enable = true;
  services.pipewire.wireplumber.enable = true;
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  services.pcscd.enable = true;
  programs.gnupg.agent = {
    enable = true;
    pinentryFlavor = "curses";
    enableSSHSupport = true;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh = {
    enable = true;
    # require public key authentication for better security
    settings.PasswordAuthentication = false;
    settings.KbdInteractiveAuthentication = false;
    #settings.PermitRootLogin = "yes";
  };

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 80 7070 8069 ];
  networking.firewall.allowedUDPPorts = [ 2088 ];
  networking.firewall.allowedUDPPortRanges = [{ from = 60000; to = 61000; }];
  networking.firewall.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
} 
