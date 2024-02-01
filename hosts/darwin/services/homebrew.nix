{ config, lib, pkgs, ... }:

{
  homebrew = {
    enable = true;
		global = {
			autoUpdate = false;
			brewfile = true;
		};
		onActivation = {
			autoUpdate = true;
			cleanup = "zap";
			upgrade = true;
		};
    casks = [
      "boom-3d"
      "discord"
      "docker"
      "dropbox-beta"
      "font-monaspace"
      "hyper"
      "istat-menus"
      "iterm2-nightly"
      "logi-options-plus"
      "notunes"
      "obsidian"
      "spotify"
      "visual-studio-code"
      "wezterm-nightly"
    ];
		masApps = {
			"Amphetamine" = 937984704;
			"myPoint Light S" = 518658487;
      "Slack for Desktop" = 803453959;
		};
  };
}
