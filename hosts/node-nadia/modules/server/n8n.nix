{config, packages, ...}:
{
  services.n8n = {
    enable = true;
    openFirewall = true;
  };
}