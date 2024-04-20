{ config, pkgs, ... }:
{
  programs.nh.enable = true;

  environment.systemPackages = with pkgs; [
    # <-------- Core -------->
    stdenv.cc
    binutils
    ncurses5
    libGLU
    libGL
    zlib
    zip
    unzip
    btop
    linuxPackages.nvidia_x11
    ntfs3g
    freeglut
    pmutils
    # xorg.libXi
    # xorg.libXmu
    # xorg.libXext
    # xorg.libX11
    # xorg.libXv
    # xorg.libXrandr
    gparted
    psmisc
    wl-clipboard
  ];
}
