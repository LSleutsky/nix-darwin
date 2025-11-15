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
      nmap
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

      (pkgs.python3Packages.buildPythonApplication {
        pname = "gitfetch-fixed";
        version = "1.3.2";

        src = inputs.gitfetch;

        format = "pyproject";

        # Required for building pyproject packages using setuptools backend
        nativeBuildInputs = [
          pkgs.python3Packages.setuptools
          pkgs.python3Packages.wheel
        ];

        # Actual gitfetch runtime dependencies
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
