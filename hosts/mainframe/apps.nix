{ config, pkgs, ... }:
{
    # Enable VPN
    services.tailscale.enable = true;

    # Virtualisation
    virtualisation.libvirtd.enable = true;
    virtualisation.libvirtd.qemu.swtpm.enable = true;
    virtualisation.libvirtd.allowedBridges = [ "virbr0" ];
    virtualisation.waydroid.enable = true;
    virtualisation.docker.enable = true;


    # Display stuff
    services.xserver = {
    	displayManager.sddm.enable = true;
	    desktopManager.plasma5.enable = true;
    };

    # Audio
    security.rtkit.enable = true;
    services.pipewire = {
    	enable = true;
    	alsa.enable = true;
    	alsa.support32Bit = true;
    	pulse.enable = true;
    	jack.enable = true;
    };
    # System Install Applications
    environment.systemPackages = with pkgs; [
    # <-------- Core -------->
    stdenv.cc binutils ncurses5 libGLU libGL zip unzip nerdfonts btop
    cudatoolkit
    linuxPackages.nvidia_x11
    xorg.libXi xorg.libXmu freeglut
    pmutils
    xorg.libXext xorg.libX11 xorg.libXv xorg.libXrandr zlib
    libreoffice
    virt-manager
    win-virtio
    gparted
    bottles
    psmisc
    wine
    # <-------- Virtualisation/Containers -------->
    docker 
    # <-------- Shell/Terminal -------->
    kitty # GPU accellerated Terminal.
    helix marksman # Text editor accesed with hx comes with sensible defaults and LSPs.
    neovim # Best text editor.
    zfxtop
    obsidian
    zellij # Basically a rust based modern version of tmux.
    # <-------- Charm.sh -------->
    glow # Render markdown in the terminal.
    skate 
    mods # Use AI to inturpret the output of a command and do stuff with it.
    gnome.nautilus
    pop # Send emails from the terminal using resend API .
    gum
    # <-------- Camera/Video/Audio  -------->
    motion
    ffmpeg
    helvum
    # <-------- Misc -------->
    neofetch rpi-imager swaynotificationcenter
    # <-------- Browser -------->
    vivaldi
    tor-browser-bundle-bin
    # <-------- File Shareing -------->
    sshfs
    # <-------- SSH/Remote -------->
    mosh # Mobile SSH more stable shell using mobile phone.
    freerdp # Remote Desktop 
    # <-------- Network Tools -------->
    nmap # Network swiss army knife
    # <-------- Secrets/Passwords -------->
    bitwarden pass wl-clipboard
    # tests
    home-manager
    ollama
    walk
    nvtop
    prusa-slicer
    pywal
    insomnia
    ];

    programs = {
        fish = {
          enable = true;
	        shellAbbrs = {
	            # Quick Nix
	          nx = "sudo nixos-rebuild switch";
	          nxconf = "sudo nvim /etc/nixos/configuration.nix";
	        };
        };
  	    steam = {
  	      enable = true;
  	      remotePlay.openFirewall = true;
  	      dedicatedServer.openFirewall = true;
      	};
      };
  
    environment.sessionVariables = {
      EDITOR = "nvim";
    };
}
