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
      "mas"
      "postgresql@17"
      "tty-clock"
      "webp"
    ];
    casks = [
      "adobe-creative-cloud"
      "alt-tab"
      "boom-3d"
      "discord"
      "docker"
      "dropbox@beta"
      "evernote"
      "font-monaspace"
      "ghostty"
      "google-chrome"
      "istat-menus"
      "iterm2@nightly"
      "logi-options+"
      "notunes"
      "postman"
      "postman-cli"
      "spotify"
      "steam"
      "visual-studio-code"
    ];
		masApps = {
			"Amphetamine" = 937984704;
			"myPoint Light S" = 518658487;
      "Slack for Desktop" = 803453959;
      "Xcode" = 497799835;
		};
  };
}
