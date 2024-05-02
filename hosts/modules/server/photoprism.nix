{config, pkgs, ...}:
{
  services.photoprism = {
    enable = true;
    port = 2342;
    originalsPath = "/var/lib/private/photoprism/originals";
    address = "0.0.0.0";
    settings = {
      PHOTOPRISM_ADMIN_USER = "admin";
      PHOTOPRISM_ADMIN_PASSWORD = "temp123";
      PHOTOPRISM_DEFAULT_LOCALE = "en";
      PHOTOPRISM_UPLOAD_NSFW = "true";
    };
  };
}
