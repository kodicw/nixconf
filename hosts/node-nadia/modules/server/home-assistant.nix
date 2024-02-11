{ config, pkgs, ... }:

{
  services.home-assistant = {
    enable = true;
    config = {
      http ={
        server_host = "0.0.0.0";
      };
      default_config = {};
    };
  };	
}
