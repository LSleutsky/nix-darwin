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
      "adobe-creative-cloud"
      "boom-3d"
      "discord"
      "docker"
      "dropbox-beta"
      "font-monaspace"
      "istat-menus"
      "iterm2-nightly"
      "logi-options-plus"
      "notunes"
      "obsidian"
      "postman"
      "postman-cli"
      "spotify"
      "visual-studio-code"
    ];
		masApps = {
      "Amazon Kindle" = 302584613;
			"Amphetamine" = 937984704;
			"myPoint Light S" = 518658487;
      "Slack for Desktop" = 803453959;
		};
  };
}
