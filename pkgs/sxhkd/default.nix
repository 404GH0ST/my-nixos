{
  stdenv,
  lib,
}: let
  sxhkd = ./sxhkd;
in
  stdenv.mkDerivation {
    pname = "my-sxhkd-config";
    version = "0.1.0";

    buildCommand = ''
      mkdir -p $out
      cp -r ${sxhkd}/* "$out/"
    '';

    meta = with lib; {
      description = "404gh0st's sxhkd config";
      homepage = "https://tux.rs";
      platforms = platforms.all;
      license = licenses.gpl3;
    };
  }
