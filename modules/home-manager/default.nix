{ config, lib, pkgs, ... }:
{
  imports = [
    ./dotfiles/ignore.nix
    ./dotfiles/nanorc.nix
    ./dotfiles/neofetch.nix
    ./dotfiles/vimrc.nix
    ./dotfiles/wezterm.nix
    ./packages/bat.nix
    ./packages/btop.nix
    ./packages/command-not-found.nix
    ./packages/eza.nix
    ./packages/fzf.nix
    ./packages/git.nix
    ./packages/ripgrep.nix
    ./packages/starship.nix
    ./packages/thefuck.nix
    ./packages/watson.nix
    ./packages/zoxide.nix
    ./packages/zsh.nix
  ];

  home = {
    stateVersion = "24.11";
    packages = with pkgs; [
      _1password-cli
      asciinema
      asciiquarium
      cmatrix
      curl
      duf
      fastfetch
      fd
      figlet
      fortune
      glow
      google-chrome
      hugo
      imagemagick
      jdk
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
      tealdeer
      tree
      weather
      yamllint
      zk

      (ripgrep-all.overrideAttrs (old: {
        doInstallCheck = false;
      }))
    ];
  };

  xdg.enable = true;
}
