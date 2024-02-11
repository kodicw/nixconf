{config, pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    thonny
    minicom
  ];
}
