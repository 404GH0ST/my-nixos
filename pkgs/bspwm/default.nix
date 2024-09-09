{
  stdenv,
  lib,
}: let
  bspwm = ./bspwm;
in
  stdenv.mkDerivation {
    pname = "my-bspwm-config";
    version = "0.1.0";

    buildCommand = ''
      mkdir -p $out
      cp -r ${bspwm}/* "$out/"
    '';

    meta = with lib; {
      description = "404gh0st's bspwm config";
      homepage = "https://tux.rs";
      platforms = platforms.all;
      license = licenses.gpl3;
    };
  }
