{
  lib,
  stdenv,
  fetchurl,
  fetchzip,
  buildNpmPackage,
  makeWrapper,
}:

let
  version = "0.1.11";
  srcCli = fetchurl {
    url = "https://registry.npmjs.org/@voidzero-dev/vite-plus-cli-linux-x64-gnu/-/vite-plus-cli-linux-x64-gnu-${version}.tgz";
    sha256 = "1qp0p1dw8y3yp6p0030lsz2xdzjpp76j9gkr1gjxr9xxbph167js";
  };

  srcNative = fetchurl {
    url = "https://registry.npmjs.org/@voidzero-dev/vite-plus-linux-x64-gnu/-/vite-plus-linux-x64-gnu-${version}.tgz";
    sha256 = "09vy5w57ziygm43v46sj10823h74fisk9z85z4s0xndbrk2108m3";
  };

  srcVitePlus = fetchzip {
    url = "https://registry.npmjs.org/vite-plus/-/vite-plus-${version}.tgz";
    sha256 = "sha256-aUcOcm491MnuZBmv5WQZhivXCeoo6l7nFHLbO1MeKyk=";
  };

  vitePlusPkg = buildNpmPackage {
    pname = "vite-plus";
    inherit version;
    src = srcVitePlus;
    npmDepsHash = "sha256-ktLmIQq7WvH+XCXHhudgX4Gmlr9yT2qCCMNri+D2XkQ=";
    dontNpmBuild = true;
    dontNpmPrune = true;
    npmInstallFlags = [ "--omit=dev" "--ignore-scripts" "--legacy-peer-deps" ];
    postPatch = ''
      cp ${./vite-plus-package-lock.json} package-lock.json
      node -e "const fs = require('fs'); const pkg = JSON.parse(fs.readFileSync('package.json', 'utf8')); delete pkg.devDependencies; fs.writeFileSync('package.json', JSON.stringify(pkg, null, 2));"
    '';
  };
in
stdenv.mkDerivation {
  pname = "vite-plus";
  inherit version;

  src = srcCli;

  nativeBuildInputs = [ makeWrapper ];
  dontUnpack = true;

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin $out/lib/vite-plus $out/libexec
    tar -xzf $src -C $out/libexec --strip-components=1 package/vp
    chmod +x $out/libexec/vp

    cp -R ${vitePlusPkg}/lib/node_modules/vite-plus/* $out/lib/vite-plus/
    chmod -R u+w $out/lib/vite-plus
    substituteInPlace $out/lib/vite-plus/dist/global/create.js \
      --replace "else fs.copyFileSync(src, dest);" "else { fs.copyFileSync(src, dest); fs.chmodSync(dest, fs.statSync(dest).mode | 0o200); }"
    mkdir -p $out/lib/vite-plus/binding
    tar -xzf ${srcNative} -O package/vite-plus.linux-x64-gnu.node > $out/lib/vite-plus/binding/vite-plus.linux-x64-gnu.node
    ln -s $out/lib/vite-plus $out/lib/vite-plus/node_modules/vite-plus

    makeWrapper $out/libexec/vp $out/bin/vp \
      --set VITE_GLOBAL_CLI_JS_SCRIPTS_DIR $out/lib/vite-plus/dist
    runHook postInstall
  '';

  meta = with lib; {
    description = "Vite+ CLI";
    homepage = "https://viteplus.dev";
    license = licenses.mit;
    platforms = [ "x86_64-linux" ];
    mainProgram = "vp";
    maintainers = [ ];
  };
}
