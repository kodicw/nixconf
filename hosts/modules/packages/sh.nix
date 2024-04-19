{ config, pkgs, ... }:
{

  environment.systemPackages = with pkgs; [
    kitty # GPU accellerated Terminal.
    helix
    marksman # Text editor accesed with hx comes with sensible defaults and LSPs.
    neovim # Best text editor.
    zellij # Basically a rust based modern version of tmux.
    starship # Fancy prompt.
    # <-------- Charm.sh -------->
    glow # Render markdown in the terminal.
    skate
    mods # Use AI to inturpret the output of a command and do stuff with it.
    gum
  ];
  programs = {
    fish = {
      enable = true;
      shellAbbrs = {
        # Quick Nix
        nx = "sudo nixos-rebuild switch";
      };
    };
  };
}
