{ config, lib, pkgs, ... }:

{
  imports = [
    ./dotfiles/nanorc.nix
    ./dotfiles/vimrc.nix
    ./packages/fzf.nix
    ./packages/eza.nix
    ./packages/starship.nix
    ./packages/zoxide.nix
    ./packages/zsh.nix
  ];

  home.stateVersion = "24.05";
  home.packages = with pkgs; [
		fortune
		lolcat
		neo-cowsay
		pipes-rs
  ];

  xdg.enable = true;
}
