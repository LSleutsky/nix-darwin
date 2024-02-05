{ config, lib, pkgs, ... }:
{
  imports = [
    ./dotfiles/hyper.nix
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
    ./packages/ncmpcpp.nix
    ./packages/ripgrep.nix
    ./packages/starship.nix
    ./packages/thefuck.nix
    ./packages/watson.nix
    ./packages/zoxide.nix
    ./packages/zsh.nix
  ];

  home = {
    stateVersion = "24.05";
    packages = with pkgs; [
      _1password
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
      yamllint
      zk

      (ripgrep-all.overrideAttrs (old: {
        doInstallCheck = false;
      }))
    ];
  };

  xdg.enable = true;
}
