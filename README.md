![Preview](preview.png)

## Install
Configurate plymouth
```nix
{ pkgs, ... }: let
    mac-style-src = pkgs.fetchFromGitHub {
      owner = "daVinci13";
      repo = "nixos_boot_plymouth_theme";
      rev = "bc585b7f42af415fe40bece8192d9828039e6e20";
      sha256 = "sha256-yOvZ4F5ERPfnSlI/Scf9UwzvoRwGMqZlrHkBIB3Dm/w=";
    };
    mac-style-load = pkgs.callPackage mac-style-src {};
in {
  boot = {
    plymouth = {
      enable = true;
      theme = "mac-style";
      themePackages = [ mac-style-load ];
    };
  };
}
```
