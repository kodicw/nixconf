{ config, pkgs, ... }:
{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];
  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable opengl
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
  
  # Networking
  networking.hostName = "mainframe";


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
  
  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.videoDrivers = ["nvidia"];

  # Enable Wayland compositor Sway
  programs.sway.enable = true;
  xdg.portal.wlr.enable = true;

  # Nvidia GPU drivers
  hardware.nvidia = {
    # Modesetting is needed for most Wayland compositors
    modesetting.enable = true;
    # Use the open source version of the kernel module
    open = false;
    # Enable the nvidia settings menu{from = 60000; to = 61000;} 22 ];
    nvidiaSettings = true;
    # Optionally, you may need to select the appropriate driver version for your specific GPU.
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  # Virtualization
  virtualisation.libvirtd.enable = true;
  virtualisation.libvirtd.allowedBridges = [ "virbr0" ];
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  environment.gnome.excludePackages = (with pkgs; [
    gnome-tour
  ]) ++ ( with pkgs.gnome; [
    gnome-music gnome-terminal epiphany geary tali atomix hitori
  ]);

  # Configure keymap in X11
  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound with pipewire.
  sound.enable = true;

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  programs.fish = {
      enable = true;
      shellAbbrs = {
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
  users.defaultUserShell = pkgs.fish;
  
  users.users.charles = {
    isNormalUser = true;
    useDefaultShell = true;
    description = "charles";
    extraGroups = [ "networkmanager" "wheel" "libvertd" ];
    packages = with pkgs; [
      # Browser
      vivaldi
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICiDe2CMnDgWjXqMpQHxCSOmrjuAWwZazYPORZXlr2SF u0_a518@localhost"
    ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  environment.variables = {
    EDITOR = "nvim";
  };
  environment.systemPackages = with pkgs; [
  # UTILS
  prusa-slicer curl
  # CLI tools
  neovim tmux exa neofetch
  # SSH tools
  mosh
  # Shell/Terminal
  kitty
  # Dev ENV
  git go rustup cargo ruff gcc clang nodejs_20
  (python311.withPackages(ps: with ps; [ pandas
                                         requests 
                                         flask
                                         selenium
                                         sqlalchemy
                                       ]))
  # Networking tools
  tshark bettercap nmap
  # Pentesting to tools
  metasploit hashcat john
  # Process analysis
  btop
  # Containerization/virtualization
  virt-manager
  docker
  # Remote Desktop Manager
  freerdp tigervnc
  nerdfonts
  unzip zip
  steam
  # UTILS
  rpi-imager sshfs libreoffice home-manager 
  # Pass UTILS
  pass wl-clipboard
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
  # networking.firewall.allowedUDPPorts = [ ];
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
