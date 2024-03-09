{ config, pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    chromedriver
    postgresql
    git
    cudatoolkit
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
      (buildPythonPackage rec {
        pname = "undetected-chromedriver";
        version = "2.1.1";
        src = fetchPypi {
          inherit pname version;
          sha256 = "sha256-YxWr8qTnglkhP1SwevCFscI0zu/U4gvuEmtb6cHQ7Wk=";
        };
        doCheck = false;
      }
      )
    ]))
  ];
}
