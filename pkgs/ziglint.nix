{
  lib,
  stdenv,
  fetchurl,
}:

stdenv.mkDerivation rec {
  pname = "ziglint";
  version = "0.5.2";

  src = fetchurl {
    url = "https://github.com/rockorager/ziglint/releases/download/v${version}/ziglint-x86_64-linux.tar.gz";
    sha256 = "sha256-XqxsF1/0iDCg4Nl4SpY8wvNfLVOkZSEsyVNSXo9d9rs=";
  };

  sourceRoot = ".";

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    cp ziglint $out/bin/
    chmod +x $out/bin/ziglint
    runHook postInstall
  '';

  meta = with lib; {
    description = "Opinionated linter for Zig source code";
    homepage = "https://github.com/rockorager/ziglint";
    license = licenses.mit;
    platforms = [ "x86_64-linux" ];
  };
}
