{ config, lib, pkgs, ... }:
let
  cfg = config.my.nix.settings;
in
with lib;
{
  options = {
    my.nix.settings.enable = mkEnableOption "Enable My Nix settings";
  };
  config = mkIf cfg.enable {
    nix = {
      gc.automatic = true;
      settings = {
        experimental-features = [ "nix-command" "flakes" ];
        auto-optimise-store = true;
      };
    };
  };
}
