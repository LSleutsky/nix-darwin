{ ... }:

{
  homebrew = {
    enable = true;
		global = {
			autoUpdate = false;
			brewfile = false;
		};
		onActivation = {
			autoUpdate = true;
			cleanup = "zap";
			upgrade = true;
		};
    brews = [
      "cbonsai"
      "docker-compose"
      "lua"
      "luarocks"
      "mas"
      "maven"
      "postgresql@17"
      "tty-clock"
      "watchman"
      "webp"
    ];
    casks = [
      "adobe-creative-cloud"
      "alt-tab"
      "boom-3d"
      "calibre"
      "discord"
      "docker-desktop"
      "dropbox@beta"
      "evernote"
      "font-monaspace"
      "ghostty"
      "istat-menus"
      "iterm2@nightly"
      "logi-options+"
      "notunes"
      "obsidian"
      "openmtp"
      "postman"
      "postman-cli"
      "spotify"
      "steam"
      "tailscale-app"
      "visual-studio-code"
      "zulu@17"
    ];
		masApps = {
			"Amphetamine" = 937984704;
			"myPoint Light S" = 518658487;
      "Slack for Desktop" = 803453959;
      "Xcode" = 497799835;
		};
  };
}
