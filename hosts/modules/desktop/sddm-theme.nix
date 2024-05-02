{ pkgs }:

let
  imgLink = "https://w.wallhaven.cc/full/o5/wallhaven-o5ezel.jpg";

  image = pkgs.fetchurl {
    url = imgLink;
    sha256 = "sha256-Lzle/UorkW3wS56cD8YB9XCHYBdi1TXxqZeEcXmwfmc=";
  };
in
  pkgs.stdenv.mkDerivation {
    name = "sweet";
    src = pkgs.fetchFromGitHub {
      owner = "MarianArlt";
      repo = "kde-plasma-chili";
      rev = "a371123959676f608f01421398f7400a2f01ae06";
      hash = "sha256-fWRf96CPRQ2FRkSDtD+N/baZv+HZPO48CfU5Subt854=";
    };
  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
    cd $out/components/artwork
    rm background.jpg
    cp -r ${image} $out/components/artwork/background.jpg
      
   '';
}
