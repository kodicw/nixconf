{ config, pkgs, ... }:
{
  security.rtkit.enable = true;
  # System Install Applications
  environment.systemPackages = with pkgs;
    [
      # <-------- Shell/Terminal -------->
      obsidian
      libreoffice
      # <-------- Camera/Video/Audio  -------->
      gnome.nautilus
      motion ffmpeg helvum vlc
      # <-------- Misc -------->
      neofetch
      rpi-imager
      swaynotificationcenter
      # <-------- Browser -------->
      vivaldi tor-browser-bundle-bin
      # <-------- File Shareing -------->
      sshfs
      # <-------- SSH/Remote -------->
      mosh # Mobile SSH more stable shell using mobile phone.
      freerdp # Remote Desktop 
      # <-------- Network Tools -------->
      nmap # Network swiss army knife
      # <-------- Secrets/Passwords -------->
      bitwarden pass
      # tests
      stacer
      home-manager
      rclone
      ollama
      # walk
      nvtopPackages.full
      blender
      nerdfonts #TODO override default font
      pop # Send emails from the terminal using resend API .
      prusa-slicer
      pywal
      linuxKernel.packages.linux_6_6.rtl88x2bu # For Realtek 88x2bu wifi dongle
    ];

  environment.sessionVariables = {
    EDITOR = "nvim";
  };
}
