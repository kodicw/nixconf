{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gosh
    burpsuite
  ];
}
