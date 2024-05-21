{ config, pkgs, lib, ... }:
let
  javascript = with pkgs; [
    bun
  ];
  cc = with pkgs; [
    clang
    gcc
  ];

  tools = with pkgs; [
    lazygit
    lazydocker
    chromedriver
    postgresql
    # cudatoolkit
    ruff
  ];

  nixStuff = with pkgs; [
    nixpkgs-fmt
    just
  ];

  golang = with pkgs; [
    go
    gopls
  ];

  learningLanguages = with pkgs; [
    rustup
    cargo
    rust-analyzer
    ruby
    zig
  ];

  ython = with pkgs; [
    (python311.withPackages (ps: with ps; [
      pandas
      pillow
      requests
      flask
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
in
{
  options = {
    hacker.enable = lib.mkEnableOption "";
  };
  config = lib.mkIf config.hacker.enable {
    environment.systemPackages =
      javascript ++
      cc ++
      tools ++
      golang ++
      learningLanguages ++
      ython ++
      nixStuff;
  };
}
