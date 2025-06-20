## Install
Configurate plymouth
```nix
{ pkgs, ... }: let
    nixos-src = pkgs.fetchFromGitHub {
      owner = "daVinci13";
      repo = "nixos_boot_plymouth_theme";
      # Fill in these after your first push:
      rev = "<commit-sha>"; # TODO: set after first push
      sha256 = "<sha256>";  # TODO: set after first push
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
