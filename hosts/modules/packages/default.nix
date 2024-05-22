{ lib, ... }:
{
  imports = [
    ./apps.nix
    ./audio.nix
    ./hacker.nix
    ./gaming.nix
    ./virtualization.nix
    ./nixappstore.nix
    ./nixsettings.nix
    ./remoteAccess.nix
  ];
}
