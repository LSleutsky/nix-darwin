{ config, lib, pkgs, ... }:

{
  homebrew = {
    enable = true;
    caskArgs.no_quarantine = true;
    global.autoUpdate = true;
    global.brewfile = true;
    brews = [
      "tty-clock"
    ];
    casks = [
      "1password-nightly"
      "boom-3d"
      "istat-menus"
      "iterm2-nightly"
      "notunes"
      "smcfancontrol"
    ];
    taps = [
      "homebrew/cask"
      "homebrew/cask/fonts"
      "homebrew/cask/versions"
    ];
  };
}
