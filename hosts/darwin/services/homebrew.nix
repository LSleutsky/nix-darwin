{ config, lib, pkgs, ... }:

{
  homebrew = {
    enable = true;
    caskArgs.no_quarantine = true;
    global.autoUpdate = true;
    global.brewfile = true;
    casks = [
      "1password"
      "1password-cli"
      "iterm2-nightly"
    ];
    taps = [
      "homebrew/cask"
      "homebrew/cask/fonts"
      "homebrew/cask/versions"
    ];
  };
}
