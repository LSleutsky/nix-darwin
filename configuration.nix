{ config, lib, pkgs, ... }:

{
  security.pam.enableSudoTouchIdAuth = true;
  time.timeZone = "America/New_York";

  nix = {
    settings = {
      auto-optimise-store = true;
      trusted-users = ["@admin"];
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
  };

  services = {
    nix-daemon.enable = true;
  };

  environment.shells = with pkgs; [
    bashInteractive
    zsh
  ];

  programs = {
    man.enable = true;
    nix-index.enable = true;
    zsh.enable = true;
  };

  users.users.lushsleutsky = {
    description = "Lush Sleutsky";
    home = "/Users/lushsleutsky";
    shell = pkgs.zsh;
  };

  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
      recursive
      (nerdfonts.override {
        fonts = ["JetBrainsMono" "RobotoMono" "ComicShannsMono"];
      })
    ];
  };
}
