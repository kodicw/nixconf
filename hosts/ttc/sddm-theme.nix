{ pkgs }:

let
  imgLink = "https://katu.com/resources/media2/16x9/full/1500/center/80/00338a44-d1b6-443f-afbd-90e
241d5407a-jumbo16x9_OMSIexterior2captioned.jpg";

  image = pkgs.fetchurl {
    url = imgLink;
    sha256 = "sha256-HrcYriKliK2QN02/2vFK/osFjTT1NamhGKik3tozGU0=";
  };
in
pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
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
