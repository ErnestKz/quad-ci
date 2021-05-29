{ mkDerivation
, stdenv
, base
, haskell-language-server
}:

mkDerivation {
  pname = "quad";
  version = "0.1.1.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base
  ];
  buildTools = [
    haskell-language-server
  ];
  license = "MIT";
  hydraPlatforms = stdenv.lib.platforms.none;
}
