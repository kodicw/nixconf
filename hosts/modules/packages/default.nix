{lib, ...}:
{
  imports = [
    ./apps.nix
    ./audio.nix
    ./hacker.nix
    ./gaming.nix
    ./virtualization.nix
    ./remoteAccess.nix
  ];
  gaming.enable = lib.mkDefault true;
  remoteAccess.enable = lib.mkDefault true;
  hacker.enable = lib.mkDefault true;
}
