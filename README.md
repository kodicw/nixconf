<<<<<<< HEAD
# nixconf
## About
  This is my personal nix configuration. I've split into sevreral .nix files to organize it.
  you can import indavidual nix configs or all of them. this is still a work in progress.
=======
# NixConf

This repository contains my personal Nix configuration split into several .nix files for better organization and ease of use. The configurations cover a broad range of applications from core system settings to web browsers and network tools, all set up with my preferred settings. 

This is a continually evolving work in progress, and you can import individual nix configs or all of them based on your preference.
Pre-configured applications and services include:

![Image of my desktop](./20231113_21h01m37s_grim.png)

- Virtual Management tools: Docker, Virt-Manager, Tailscale
- Display (Plasma5), audio (Pipewire), text editors (Neovim, Helix)
- Shell/Terminal: Kitty, Zellij
- Charm.sh tools: Glow, Skate, Mods, Pop, Gum
- Video/Camera tools: Motion, FFMpeg, Helvum
- Browsers: Vivaldi, TOR
- File Sharing: SSHFS
- Remote access tools: Mosh, FreeRDP
- Network tools: nMap
- Secret management tools: Bitwarden, Pass
- Misc: Neofetch, rpi-imager, swaynotificationcenter
- Other programs: Fish, Steam

Additionally, Fish is configured with abbreviations for quick Nix operations, and the system environment is set up to prompt Electron apps to use Wayland.

The `apps.nix` file includes the main system configuration, and the `hyprland.nix` file contains tweaks for running Hyprland.

## Usage
**Note this does not work yet**
First, clone this repository to your local machine.

Then, navigate to your configuration.nix add the imports and run the command `sudo nixos-rebuild switch` to apply the configuration. 

Please make sure to have the appropriate permissions and system requirements before applying any configurations.  

## Contribution

As this repository hosts my personal configurations, any changes reflect my personal preference. However, I encourage you to use these configurations as a reference or starting point. If you want to propose changes or improvements, feel free to Open an issue or submit a pull request, and I will review it when I can.
