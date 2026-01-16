{ config, inputs, lib, pkgs, ... }:

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
    stateVersion = "26.05";
    packages = with pkgs; [
      _1password-cli
      asciinema
      asciiquarium
      awscli2
      cloc
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
      nmap
      onefetch
      optipng
      pandoc
      pipes-rs
      pngquant
      postgresql
      rustup
      scc
      supabase-cli
      tealdeer
      tmux
      tree
      watchman
      weather
      yamllint
      zk

      (ripgrep-all.overrideAttrs (old: {
        doInstallCheck = false;
      }))

      (pkgs.python3Packages.buildPythonApplication {
        pname = "gitfetch-fixed";
        version = inputs.gitfetch.shortRev or "latest";
        src = inputs.gitfetch;
        format = "pyproject";

        nativeBuildInputs = [
          pkgs.python3Packages.setuptools
          pkgs.python3Packages.wheel
        ];

        propagatedBuildInputs = [
          pkgs.python3Packages.webcolors
          pkgs.python3Packages.requests
          pkgs.python3Packages.rich
          pkgs.python3Packages.readchar
        ];

        pythonImportsCheck = [
          "gitfetch"
        ];
      })
    ];
  };

  xdg.enable = true;
}
