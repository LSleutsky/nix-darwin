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
    cmatrix
    curl
    fd
    figlet
		fortune
		lolcat
    nano
    nanorc
		neo-cowsay
    neofetch
    nginx
    onefetch
		pipes-rs
    ripgrep
    ripgrep-all
    scc
    tlrc
    tree
    zk
  ];

  xdg.enable = true;
}
