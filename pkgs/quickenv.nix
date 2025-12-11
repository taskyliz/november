{
  lib,
  stdenv,
  fetchurl,
}:

stdenv.mkDerivation rec {
  pname = "quickenv";
  version = "0.4.7";

  src = fetchurl {
    url = "https://codeberg.org/untitaker/quickenv/releases/download/${version}/quickenv-${version}-x86_64-unknown-linux-gnu.tar.gz";
    sha256 = "1yk347gq2nr1518z4g9ci5rhhjh5va2dha9qy538mbvv91yivzy6";
  };

  sourceRoot = ".";

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    cp quickenv $out/bin/
    chmod +x $out/bin/quickenv
    runHook postInstall
  '';

  meta = with lib; {
    description = "An unintrusive environment manager";
    homepage = "https://codeberg.org/untitaker/quickenv";
    license = licenses.mit;
    platforms = [ "x86_64-linux" ];
    maintainers = [ ];
  };
}
