{ config, pkgs, ... }:
{
# Install Hyperland and fix some stuff
    environment.sessionVariables = {
    	# Fix invisible cursor
        WLR_NO_HARDWARE_CURSORS = "1";
	# Hint electron apps to use wayland
	NIXOS_OZONE_WL = "1";
    };
    programs = {
	hyprland = {
	enable = true;
	enableNvidiaPatches = true;
	xwayland.enable = true;
	};
    };
    environment.systemPackages = with pkgs; [
        # Hyprland 
	rofi
	swww
	waypaper
	waybar
	dunst
    ];
}
