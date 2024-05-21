{ pkgs, config, lib, ... }:
let
  cfg = config.myGreetd;
in
with lib;
{
  options = {
    myGreetd.enable = mkEnableOption "Enable greetd";
  };
  config = mkIf cfg.enable {
    services.greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --cmd Hyprland";
          user = "charles";
        };
      };
    };
  };
}
