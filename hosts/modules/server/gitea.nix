{ config, pkgs, ... }:
{
  services.gitea = {
    enable = true;
    settings = {
      server.HTTP_PORT = 8082;
    };
  };
}

