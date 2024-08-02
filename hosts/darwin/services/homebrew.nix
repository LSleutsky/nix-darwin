{ ... }:

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
    brews = [
      "cbonsai"
      "docker-compose"
      "tty-clock"
    ];
    casks = [
      "adobe-creative-cloud"
      "boom-3d"
      "discord"
      "docker"
      "dropbox@beta"
      "evernote"
      "font-monaspace"
      "google-chrome"
      "istat-menus"
      "iterm2@nightly"
      "logi-options-plus"
      "notunes"
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
