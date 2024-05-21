{ pkgs, ... }:
pkgs.stdenv.mkDerivation {
  name = "fallout-grub-theme";
  src = pkgs.fetchFromGitHub {
    owner = "shvchk";
    repo = "fallout-grub-theme";
    rev = "e8433860b11abb08720d7c32f5b9a2a534011bca";
    hash = "sha256-mvb44mFVToZ11V09fTeEQRplabswQhqnkYHH/057wLE=";
  };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
  '';
}

