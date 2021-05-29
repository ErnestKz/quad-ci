{ mkDerivation
, stdenv
, base
, haskell-language-server
, aeson
, async
, butcher
, hslogger
, http-client
, http-conduit
, network
, record-hasfield
, rio
, scotty
, serialise
, stm
, time
, typed-process
, wai-cors
, yaml
, record-dot-preprocessor  
}:

mkDerivation {
  pname = "quad";
  version = "0.1.1.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    base
    aeson
    async
    butcher
    hslogger
    http-client
    http-conduit
    network
    record-hasfield
    rio
    scotty
    serialise
    stm
    time
    typed-process
    wai-cors
    yaml
    record-dot-preprocessor
  ];
  buildTools = [
    haskell-language-server
  ];
  license = "MIT";
  hydraPlatforms = stdenv.lib.platforms.none;
}
