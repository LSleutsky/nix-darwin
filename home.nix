{ config, lib, pkgs, ... }:

{
  imports = [
    ./home/starship.nix
  ];

  home.stateVersion = "24.05";
}
