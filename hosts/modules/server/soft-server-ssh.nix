{ config, pkgs, ... }:
{
  services.soft-serve = {
     enable = true;
     settings = {
       name = "Dady's repos";
       log_format = "text";
      ssh = {
        listen_addr = ":23231";
         public_url = "ssh://node-nadia:23231";
         max_timeout = 30;
        idle_timeout = 120;
       };
       users = {
        name = "charles";
        admin = true;
        public-key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICiDe2CMnDgWjXqMpQHxCSOmrjuAWwZazYPORZXlr2SF u0_a518@localhost";
       };
       stats.listen_addr = ":23233";
     };
   };
 }

