{ config, pkgs, ... }:
{
  services.homepage-dashboard = {
    enable = true;
    port = 8080;
    bookmarks = [
      {
      name = "NixOS";
      url = "https://nixos.org";
      }
      {
      name = "Nixpkgs";
      url = "https://nixos.org/nixpkgs";
      }
      {
      name = "Discourse";
      url = "https://discourse.nixos.org";
      }
      {
      name = "GitHub";
      url = "https://github.com";
      }
    ];
      
  };

}
