{ config, lib, pkgs, ... }:

{
  imports = [
    ./dotfiles/ignore.nix
    ./dotfiles/nanorc.nix
    ./dotfiles/neofetch.nix
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
    ./packages/thefuck.nix
    ./packages/watson.nix
    ./packages/yazi.nix
    ./packages/zoxide.nix
    ./packages/zsh.nix
  ];

  home.stateVersion = "24.05";
  home.packages = with pkgs; [
    _1password
    cmatrix
    curl
    discord
    fd
    figlet
		fortune
    glow
    imagemagick
    jq
		lolcat
    nano
    nanorc
		neo-cowsay
    neofetch
    ngrok
    onefetch
		pipes-rs
    scc
    spotify
    tlrc
    tree
    yamllint
    zk

    (ripgrep-all.overrideAttrs (old: {
      doInstallCheck = false;
    }))
  ];

  xdg.enable = true;
}
