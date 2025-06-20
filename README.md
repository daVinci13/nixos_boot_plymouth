![Preview](preview.png)

## Install
Configurate plymouth
```nix
{ config, lib, pkgs, ... }:

let
  nixos-plymouth-theme = pkgs.stdenv.mkDerivation rec {
    pname = "nixos-boot-plymouth-theme";
    version = "1.0";
    
    src = pkgs.fetchFromGitHub {
      owner = "daVinci13";
      repo = "nixos_boot_plymouth";
      rev = "master";  # or specific commit hash
      sha256 = lib.fakeSha256;
    };
    
    dontBuild = true;
    
    installPhase = ''
      mkdir -p $out/share/plymouth/themes/nixos
      cp -r * $out/share/plymouth/themes/nixos/
    '';
  };
in
{
  boot = {
    plymouth = {
      enable = true;
      theme = "nixos";
      themePackages = [ nixos-plymouth-theme ];
    };
    
    # Required for Plymouth to work properly
    initrd.systemd.enable = true;
    
    # Kernel parameters for clean boot
    kernelParams = [
      "quiet"
      "splash"
      "plymouth.ignore-serial-consoles"
    ];
  };
}
```
