{config, pkgs, ...}:
{
  services.photoprism = {
    enable = true;
    port = 2342;
    originalsPath = "/var/lib/private/photoprism/originals";
    address = "0.0.0.0";
    settings = {
      PHOTOPRISM_ADMIN_USER = "admin";
      PHOTOPRISM_ADMIN_PASSWORD = "firebird";
      PHOTOPRISM_DEFAULT_LOCALE = "en";
      PHOTOPRISM_UPLOAD_NSFW = "true";
      # PHOTOPRISM_DATABASE_DRIVER = "mysql";
      # PHOTOPRISM_DATABASE_NAME = "photoprism";
      # PHOTOPRISM_DATABASE_SERVER = "/run/mysqld/mysqld.sock";
      # PHOTOPRISM_DATABASE_USER = "photoprism";
      # PHOTOPRISM_SITE_URL = "http://sub.domain.tld:2342";
      # PHOTOPRISM_SITE_TITLE = "My PhotoPrism";
    };
  };
}
