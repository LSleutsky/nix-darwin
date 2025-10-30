{ config, lib, pkgs, ... }:

{
  imports = [
    ./dotfiles/fastfetch.nix
    ./dotfiles/ghostty.nix
    ./dotfiles/ignore.nix
    ./dotfiles/nanorc.nix
    ./dotfiles/neofetch.nix
    ./dotfiles/vimrc.nix
    ./dotfiles/zprofile.nix
    ./packages/bat.nix
    ./packages/btop.nix
    ./packages/eza.nix
    ./packages/fzf.nix
    ./packages/git.nix
    ./packages/ripgrep.nix
    ./packages/starship.nix
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
      awscli2
      cmatrix
      codecrafters-cli
      coreutils
      curl
      duf
      fastfetch
      fd
      figlet
      fortune
      go
      glow
      google-chrome
      google-cloud-sdk
      hugo
      imagemagick
      jq
      jpegoptim
      lolcat
      mousecape
      nano
      nanorc
      neo-cowsay
      neofetch
      neovim
      ngrok
      onefetch
      optipng
      pandoc
      pipes-rs
      pngquant
      postgresql
      scc
      supabase-cli
      tealdeer
      tree
      watchman
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
