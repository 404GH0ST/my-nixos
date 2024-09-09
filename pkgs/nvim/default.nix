{
  pkgs,
  stdenv,
  lib,
}: let
  nvim = pkgs.fetchFromGitHub {
    owner = "404GH0ST";
    repo = "my-nvchad-configuration";
    rev = "57d9ab7039361ebdc474b1f37c8924153535fec6";
    hash = "sha256-6n2C4DDSGR8fZlE0CddskTG0DwjDiC2OtNLh/7XtfOU=";
  };
in
  stdenv.mkDerivation {
    pname = "my-nvim-config";
    version = "1.0.0";

    buildCommand = ''
      mkdir -p $out
      cp -r ${nvim}/* "$out/"
    '';

    meta = with lib; {
      description = "404gh0st's nvim config";
      homepage = "https://404gh0st.live";
      platforms = platforms.all;
      license = licenses.gpl3;
    };
  }
