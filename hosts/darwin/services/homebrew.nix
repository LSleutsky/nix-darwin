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
      "arp-scan"
      "cbonsai"
      "docker-compose"
      "lua"
      "luarocks"
      "mas"
      "maven"
      "tty-clock"
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
      "google-chrome"
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
    ];
		masApps = {
			"Amphetamine" = 937984704;
			"myPoint Light S" = 518658487;
		};
  };
}
