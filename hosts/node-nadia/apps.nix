{config, pkgs, ...}:
# TODO
# install kasmworkspaces
# kasmvnc installation or alternative
{
  environment.systemPackages = with pkgs; [
    # Shell
    nushell
    neovim
    filebrowser
    starship
    espeak
  ];
}
