{ config, lib, pkgs, ... }:

{
  imports = [
    ./dotfiles/ignore.nix
    ./dotfiles/nanorc.nix
    ./dotfiles/vimrc.nix
    ./packages/bat.nix
    ./packages/btop.nix
    ./packages/command-not-found.nix
    ./packages/eza.nix
    ./packages/fzf.nix
    ./packages/git.nix
    ./packages/ncmpcpp.nix
    ./packages/ripgrep.nix
    ./packages/starship.nix
    ./packages/watson.nix
    ./packages/yazi.nix
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
    glow
    imagemagick
		lolcat
    nano
    nanorc
		neo-cowsay
    neofetch
    ngrok
    onefetch
		pipes-rs
    (ripgrep-all.overrideAttrs (old: {
      doInstallCheck = false;
    }))
    scc
    spotify
    tlrc
    tree
    yamllint
    zk
  ];

  xdg.enable = true;
}
