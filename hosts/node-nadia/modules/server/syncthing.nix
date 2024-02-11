{ config, pkgs, ... }:
{
  services = {
    syncthing = {
      enable = true;
      user = "charles";
      dataDir = "/home/charles/share"; # Default folder for new synced folders
      configDir = "/home/charles/.config/syncthing"; # Folder for Syncthing's settings and keys
    };
  };
}
