{ config, lib, pkgs, ... }:

{
  imports = [
    ./dotfiles/ignore.nix
    ./dotfiles/nanorc.nix
    ./dotfiles/vimrc.nix
    ./packages/eza.nix
    ./packages/fzf.nix
    ./packages/git.nix
    ./packages/starship.nix
    ./packages/zoxide.nix
    ./packages/zsh.nix
  ];

  home.stateVersion = "24.05";
  home.packages = with pkgs; [
		fortune
    inxi
		lolcat
		neo-cowsay
		pipes-rs
  ];

  xdg.enable = true;
}
