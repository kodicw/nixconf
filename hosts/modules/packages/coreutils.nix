{ config, pkgs, ... }:
{
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
    nerdfonts
    btop
    cudatoolkit
    linuxPackages.nvidia_x11
    freeglut
    pmutils
    xorg.libXi
    xorg.libXmu
    xorg.libXext
    xorg.libX11
    xorg.libXv
    xorg.libXrandr
    libreoffice
    gparted
    psmisc
    wine
    bottles
  ];
}
