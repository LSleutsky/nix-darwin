{ config, lib, pkgs, ... }:

{
  imports = [
    ./home/fzf.nix
    ./home/eza.nix
    ./home/starship.nix
    ./home/zoxide.nix
    ./home/zsh.nix
  ];

  home.stateVersion = "24.05";
  xdg.enable = true;
}
