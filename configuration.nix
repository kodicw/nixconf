# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  # Bootloader
boot.loader = {
  enable = true;
  device = "/dev/sda";
  useOSProber = true;
};
  
  # Enable opengl
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
  networking.hostName = "node-nadia";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;
  # VPN service
  services.tailscale.enable = true; 

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

  # VPN service
  services.tailscale.enable = true;
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.videoDrivers = ["nvidia"];
  # Enable Cronjob service
  services.cron.enable = true;
  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Bluetooth
  services.blueman.enable = true;
  hardware.bluetooth.package = pkgs.bluez;
  hardware.bluetooth.enable = true;

  # Enable Wayland compositor Sway
  xdg.portal = { enable = true; extraPortals = [ pkgs.xdg-desktop-portal-gtk ]; };
    # If you want to use JACK applications, uncomment this

  # Nvidia GPU drivers
  hardware.nvidia = {
    # Modesetting is needed for most Wayland compositors
    modesetting.enable = true;
    # Use the open source version of the kernel module
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # Disable Pulse audio 
  hardware.pulseaudio.enable = false;

  # Virtualization
  virtualisation.libvirtd.enable = true;
  virtualisation.libvirtd.allowedBridges = [ "virbr0" ];

  # Nix experimental 
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  programs.sway.enable = true;
  

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  #KDE Plasma5
  #services.xserver.displayManager.lightdm.greeters.slick.enable = true;
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  services.xserver.displayManager.defaultSession = "plasmawayland";
  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
  elisa
  gwenview
  okular
  oxygen
  khelpcenter
  konsole
  plasma-browser-integration
  print-manager
];

  # Enable sound with pipewire.
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };


  environment.sessionVariables = {
    # If your cursor becomes invisible
    WLR_NO_HARDWARE_CURSORS = "1";
    # Hint electron apps to use wayland
    NIXOS_OZONE_WL = "1";
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  programs = { 
    hyprland = {
      enable = true;
      enableNvidiaPatches = true;
      xwayland.enable = true;
    };
    fish = {
      enable = true;
      shellAbbrs = {
        cats = "bat";
        # Git bash commands
        gco = "git checkout";
        gcm = "git commit -m";
        gp = "git pull";
        gc = "git clone";
        gra = "git remote add";
        # python commands
        py = "python";
        py3 = "python3";
        http = "python -m http.server";
        # nixos commands
        nx = "sudo nixos-rebuild switch";
        nxsh = "nix-shell -p";
        nxconf = "sudo nvim /etc/nixos/configuration.nix";
        # Personal commands
        ls = "exa -l --icons";
        nm = "sudo nmap -sS -sC -sV -O -T4 -A -v -Pn -p- -oN nmap-scan.txt";
  };
};
};
  
  users = {
    defaultUserShell = pkgs.fish;
    users = { 
      charles = {
        isNormalUser = true;
        useDefaultShell = true;
        description = "charles";
        extraGroups = [ "networkmanager" "wheel" "libvertd" ];
        packages = with pkgs; [
          # Browser
          vivaldi
          # Hyperland stuff
          neovim
          rofi
          swww
          waypaper
          waybar
          dunst
          # Pentesting to tools
          metasploit hashcat john
          #File Manager
          google-chrome
        ];
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICiDe2CMnDgWjXqMpQHxCSOmrjuAWwZazYPORZXlr2SF u0_a518@localhost"
        ];
      };
      Angel = {
        isNormalUser = true;
        description = "Puppy girl";
        packages = with pkgs; [
          google-chrome
        ];
      };
      Phoenix = {
        isNormalUser = true;
        description = "Boo";
        extraGroups = [ "networkmanager" "wheel" "libvertd" ];
        packages = with pkgs; [
          google-chrome
          vivaldi
          swww
          obs-studio
        ];
      };
    };
  };

  
  services.hardware.openrgb.enable = true;
  services.pipewire.wireplumber.enable = true;




  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  environment.variables = {
    EDITOR = "nvim";
  };
  programs.steam = {
  enable = true;
  remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

  environment.systemPackages = with pkgs; [
  # UTILS
  prusa-slicer curl
  #Tor
  tor-browser-bundle-bin
  tor
  # CLI tools
  micro bat tmux exa neofetch walk
  # SSH tools
  mosh sshfs
  # Shell/Terminal
  kitty
  # Dev ENV
  git nim go rustup cargo ruff gcc clang nodejs_20
  (python311.withPackages(ps: with ps; [ pandas requests flask selenium sqlalchemy ffmpeg-python
                                         openpyxl pyquery
                                       ]))
  chromedriver
  # Networking tools
  tshark bettercap nmap
  # Process analysis
  btop
  # Audio
  helvum
  # Containerization/virtualization
  virt-manager docker
  # Remote Desktop Manager
  freerdp 
  nerdfonts
  unzip zip
  # UTILS
  rpi-imager libreoffice 
  # Pass UTILS
  pass wl-clipboard
  # swaync
  swaynotificationcenter
  ];

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
  # networking.firewall.allowedTCPPorts = [ ... ];
  networking.firewall.allowedUDPPorts = [2088];
  networking.firewall.allowedUDPPortRanges = [{ from = 60000; to = 61000; }];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.05"; # Did you read the comment?
} 

 
