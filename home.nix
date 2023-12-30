{ config, lib, pkgs, ... }:

{
  imports = [
    ./home/eza.nix
    ./home/starship.nix
    ./home/zsh.nix
  ];

  home.stateVersion = "24.05";
}
