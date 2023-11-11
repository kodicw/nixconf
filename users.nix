{ config, pkgs, ... }:
{
  users = {
    defaultUserShell = pkgs.nushell;
    users = { 
      charles = {
        isNormalUser = true;
        useDefaultShell = true;
        description = "charles";
        extraGroups = [ "networkmanager" "wheel" "libvertd" "docker" ];
        packages = with pkgs; [
          swww
          vivaldi
	  shell_gpt
	  pulsemixer
	  starship
          google-chrome
          obs-studio
        ];
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICiDe2CMnDgWjXqMpQHxCSOmrjuAWwZazYPORZXlr2SF u0_a518@localhost"
        ];
      };
      Angel = {
        isNormalUser = true;
        description = "Angel";
        packages = with pkgs; [
          google-chrome
        ];
      };
      Phoenix = {
        isNormalUser = true;
        description = "Boo";
        extraGroups = [ "networkmanager" "wheel" "libvertd" ];
        packages = with pkgs; [
          google-chrome
          vivaldi
          obs-studio
        ];
      };
    };
  };
}
