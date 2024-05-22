{ config, lib, pkgs, ... }:
let
  cfg = config.my.boot.grub;
in
with lib;
{
  options = {
    my.boot.grub.enable = mkEnableOption "Enable GRUB EFI support";
  };
  config = mkIf cfg.enable {
    boot.loader = {
      efi.canTouchEfiVariables = true;
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
      };
    };
  };
}
