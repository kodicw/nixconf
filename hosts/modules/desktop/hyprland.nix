{ config, pkgs, lib, ... }:
{
  options = {
    hyprlandDesktop.enable = lib.mkEnableOption "Enable Hyprland Desktop";
    };
  # Install Hyperland and fix some stuff
  config = lib.mkIf config.hyprlandDesktop.enable {
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
      hypridle
      hyprlock
      polkit # for auth
      rofi # Application search bar
      wl-clipboard
      xwaylandvideobridge
      xdg-desktop-portal
      xdg-desktop-portal-kde
      xdg-desktop-portal-wlr
      xdg-desktop-portal-hyprland
    ];
    nixpkgs.config.permittedInsecurePackages = [
      "electron-25.9.0"
    ];
  };
}
