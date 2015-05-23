{ mkDerivation, base, parsec, parsec-numbers, stdenv }:
mkDerivation {
  pname = "huttons-razor";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  buildDepends = [ base parsec parsec-numbers ];
  description = "Quick implemention of Hutton's Razor";
  license = stdenv.lib.licenses.bsd2;
}
