{ lib, ... }:
{
  imports = [
    ./sddm.nix
    ./plasma.nix
    ./hyprland.nix
    ./gnome.nix
    ./greetTUI.nix
    ./desktopPackages.nix
  ];
}
