{ config, pkgs, ... }:
{
  services.homepage-dashboard = {
    enable = true;
    listenPort = 9292;
    bookmarks = [
      {
        NixOS = [
          {
            abbr = "NixOS";
            url = "https://nixos.org";
          }
          {
            abbr = "Nixpkgs";
            url = "https://nixos.org/nixpkgs";
          }
          {
            abbr = "Discourse";
            url = "https://discourse.nixos.org";
          }
        ];
        Development = [
          {
            abbr = "GitHub";
            url = "https://github.com";
          }
          {
            abbr = "GitLab";
            url = "https://gitlab.com";
          }
          {
            abbr = "BitBucket";
            url = "https://bitbucket.org";
          }
        ];
      }
    ];  
  };

}
