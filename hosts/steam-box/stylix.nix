{ pkgs, config, ... }:

{
  stylix = {
    image = ./background.jpg;

    polarity = "dark";

    fonts = rec {
      monospace = {
        name = "Fira Code";
        package = pkgs.fira-code;
      };
      sansSerif = {
        name = "Cantarell";
        package = pkgs.cantarell-fonts;
      };
      serif = sansSerif;
    };

    targets.nixos-icons.enable = false;
    cursor = {
      package = pkgs.qogir-icon-theme;
      name = "Qogir";
    };
  };
}
