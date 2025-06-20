![Preview](preview.png)

## Install
Configurate plymouth
```nix
{ pkgs, ... }: let
    nixos-src = pkgs.fetchFromGitHub {
      owner = "daVinci13";
      repo = "nixos_boot_plymouth_theme";
      rev = "7f80e9630ba95ce2d254547a1d7becfaceae0ee9";
      sha256 = "0g3dcbs3imalfhnkhnls0vw1lpjxbi6pzp6fg4vqrwlb5ml0fdpi";
    };
    nixos_load = pkgs.callPackage nixos-src {};
in {
  boot = {
    plymouth = {
      enable = true;
      theme = "nixos";
      themePackages = [ nixos_load ];
    };
  };
}
```
