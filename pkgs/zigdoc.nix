{
  lib,
  stdenv,
  fetchFromGitHub,
  zig_0_15,
}:

stdenv.mkDerivation rec {
  pname = "zigdoc";
  version = "0.2.2";

  src = fetchFromGitHub {
    owner = "rockorager";
    repo = "zigdoc";
    rev = "v${version}";
    hash = "sha256-bvZnNiJ6YbsoQb41oAWzZNErCcAtKKudQMwvAfa4UEA=";
  };

  nativeBuildInputs = [ zig_0_15.hook ];

  dontConfigure = true;
  dontUseZigBuild = true;
  dontUseZigInstall = true;

  buildPhase = ''
    runHook preBuild
    export ZIG_GLOBAL_CACHE_DIR="$TMPDIR/zig-cache"
    mkdir -p "$ZIG_GLOBAL_CACHE_DIR"
    zig build -Dcpu=baseline --release=safe -j$NIX_BUILD_CORES --verbose
    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    cp zig-out/bin/zigdoc $out/bin/
    runHook postInstall
  '';

  meta = with lib; {
    description = "A command-line tool to view documentation for Zig standard library symbols";
    homepage = "https://github.com/rockorager/zigdoc";
    license = licenses.mit;
    platforms = [ "x86_64-linux" ];
  };
}
