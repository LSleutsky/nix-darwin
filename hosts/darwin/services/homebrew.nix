{ config, lib, pkgs, ... }:

{
  homebrew = {
    enable = true;
    caskArgs.no_quarantine = true;
    global.autoUpdate = true;
    global.brewfile = true;
    casks = [
      "1password-nightly"
      "boom-3d"
      "istat-menus"
      "iterm2-nightly"
      "notunes"
      "smcfancontrol"
    ];
  };
}
