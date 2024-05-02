{ config, pkgs, ... }:
let
  userName = "charles";
in
{
  services = {
    syncthing = {
      openDefaultPorts= true;
      enable = true;
      user = userName;
    };
  };
}
