{ lib, ... }:
{
  imports = [
    ./sddm.nix
    ./plasma.nix
    ./hyprland.nix
    ./greetTUI.nix
    ./desktopPackages.nix
  ];
}
