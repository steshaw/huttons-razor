{ mkDerivation, base, parsec, parsec-numbers, stdenv }:
mkDerivation {
  pname = "foo";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  buildDepends = [ base parsec parsec-numbers ];
  license = stdenv.lib.licenses.bsd2;
}
