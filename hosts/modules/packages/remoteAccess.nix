{config, pkgs, lib, ...}:
{
  options = {
    remoteAccess.enable = lib.mkEnableOption "Enable remote access";
  };
  config = lib.mkIf config.remoteAccess.enable {
    services.openssh = {
      enable = true;
      settings.PasswordAuthentication = false;
      settings.KbdInteractiveAuthentication = false;
      # settings.PermitRootLogin = "no";
    };
    programs.mosh.enable = true;
    environment.systemPackages = with pkgs; [sshfs] ;
  };
}
