{lib, ...}:
{
  imports = [
    ./hyprland.nix
    ./displaymanager.nix
    ./desktopPackages.nix
  ];
  # hyprlandDesktop.enable = lib.mkDefault true;
}
