{pkgs, config, ...}:
{
  services = {
    cockpit = {
      enable = true;
      port = 80;
      openFirewall = true;
    };
  };
}