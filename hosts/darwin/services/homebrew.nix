{ config, lib, pkgs, ... }:

{
  homebrew = {
    enable = true;
    caskArgs.no_quarantine = true;
    global.autoUpdate = true;
    global.brewfile = true;
    brews = [
      "nginx"
    ];
    casks = [
      "1password"
      "1password-cli"
      "boom-3d"
      "discord"
      "istat-menus"
      "iterm2-nightly"
      "smcfancontrol"
    ];
    taps = [
      "homebrew/cask"
      "homebrew/cask/fonts"
      "homebrew/cask/versions"
    ];
  };
}
