{
  pkgs ? import <nixpkgs> {},
}:
pkgs.stdenv.mkDerivation {
  pname = "nixos";
  version = "0.1.0";
  src = ./src;

  installPhase = ''
    mkdir -p $out/share/plymouth/themes/nixos
    cp -r nixos $out/share/plymouth/themes/
    chmod +x $out/share/plymouth/themes/nixos/nixos.plymouth
  '';
}
