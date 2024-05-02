{ config, pkgs, ... }:
let
  user = "charles";
in
{
  services = {
    syncthing = {
      enable = true;
      user = "charles";
    };
  };
}
