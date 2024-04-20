{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    chromedriver
    postgresql
    git
    # cudatoolkit
    nim
    go
    rustup
    piper-tts
    cargo
    zig
    ruff
    gcc
    clang
    ruby
    bun
    gopls
    mprocs
    lazydocker
    lazygit
    (python311.withPackages (ps: with ps; [
      pandas
      requests
      flask
      pillow
      selenium
      sqlalchemy
      ffmpeg-python
      openpyxl
      google-api-python-client
      pyquery
      feedparser
      langchain
      beautifulsoup4
      rich
      shodan
      openai
      python-lsp-server
    ]))
  ];
}
