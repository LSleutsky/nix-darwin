{ config, lib, pkgs, ... }:

{
  security.pam.enableSudoTouchIdAuth = true;
  time.timeZone = "America/New_York";

  nix = {
    gc = {
      user = "root";
      automatic = true;
      interval = {
        Weekday = 0;
        Hour = 3;
        Minute = 0;
      };
      options = "--delete-old";
    };
    settings = {
      auto-optimise-store = true;
      trusted-users = ["@admin"];
      experimental-features = ["nix-command" "flakes"];
    };
  };

  services = {
    nix-daemon.enable = true;
  };

  environment = {
    darwinConfig = "$HOME/.config/nix-darwin/configuration.nix";
    shells = with pkgs; [bashInteractive zsh];
    variables = {
      EDITOR = "nvim";
			NIXPKGS_ALLOW_BROKEN = "1";
			NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM = "1";
      SUDO_EDITOR = "nvim";
      PAGER = "less";
    };
  };

  programs = {
    man.enable = true;
    nix-index.enable = true;
    zsh = {
      enable = true;
      enableBashCompletion = true;
      enableCompletion = true;
      enableSyntaxHighlighting = true;
    };
  };

  users.users.lushsleutsky = {
    description = "Lush Sleutsky";
    home = "/Users/lushsleutsky";
    shell = pkgs.zsh;
  };

  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
      (nerdfonts.override {
        fonts = ["JetBrainsMono" "RobotoMono" "ComicShannsMono"];
      })
    ];
  };

  homebrew = {
    enable = true;
    global.autoUpdate = true;
    taps = [
      "homebrew/cask"
      "homebrew/cask/fonts"
      "homebrew/cask/versions"
    ];
  };
}
