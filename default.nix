{ mkDerivation, base, parsec, parsec-numbers, stdenv }:
mkDerivation {
  pname = "huttons-razor";
  version = "0.1.1.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  buildDepends = [ base parsec parsec-numbers ];
  homepage = "https://github.com/steshaw/huttons-razor";
  description = "Quick implemention of Hutton's Razor";
  license = stdenv.lib.licenses.bsd2;
}
