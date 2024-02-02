{ config, pkgs, ... }:
{
  security.rtkit.enable = true;
  # System Install Applications
  environment.systemPackages = with pkgs; [
    # <-------- Shell/Terminal -------->
    obsidian
    # <-------- Camera/Video/Audio  -------->
    gnome.nautilus
    motion
    ffmpeg
    helvum
    # <-------- Misc -------->
    neofetch
    rpi-imager
    swaynotificationcenter
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
    bitwarden
    pass
    wl-clipboard
    # tests
    stacer
    home-manager
    ollama
    walk
    nvtop
    prusa-slicer
    pywal
    linuxKernel.packages.linux_6_6.rtl88x2bu
  ];

  environment.sessionVariables = {
    EDITOR = "nvim";
  };
}
