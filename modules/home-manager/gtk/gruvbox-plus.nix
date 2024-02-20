{pkgs}: let
  link = "https://github.com/SylEleuth/gruvbox-plus-icon-pack/releases/download/v5.1/gruvbox-plus-icon-pack-5.1.zip";
in
  pkgs.stdenv.mkDerivation {
    name = "gruvbox-plus";

    src = pkgs.fetchurl {
      url = link;
      sha256 = "1n3hqwk1mqaj8vbmy0pqbiq6v5jqrhmhin506xbpnccl28f907j0";
    };

    dontUnpack = true;

    installPhase = ''
      mkdir -p $out
      ${pkgs.unzip}/bin/unzip $src -d $out/
    '';
  }