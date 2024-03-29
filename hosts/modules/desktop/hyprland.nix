{ config, pkgs, ... }:
{
  # Install Hyperland and fix some stuff
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };
  environment.sessionVariables = {
    # Fix invisible cursor
    WLR_NO_HARDWARE_CURSORS = "1";
    # Hint electron apps to use wayland
    NIXOS_OZONE_WL = "1";
  };
  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
  };
  environment.systemPackages = with pkgs; [
    # Hyprland 
    polkit # for auth
    rofi # Application search bar
    xwaylandvideobridge
    xdg-desktop-portal
    xdg-desktop-portal-kde
    xdg-desktop-portal-wlr
    xdg-desktop-portal-hyprland
  ];
  nixpkgs.config.permittedInsecurePackages = [
    "electron-25.9.0"
  ];

}
