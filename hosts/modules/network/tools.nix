{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    nmap
    bettercap
    whois
    rustscan
  ];
}
