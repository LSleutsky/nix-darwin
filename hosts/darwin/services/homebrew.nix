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
			extraFlags = [ "--force" ];
		};
		taps = [
			{ name = "b451c/quickmd"; trusted = true; }
		];
    brews = [
      "arp-scan"
      "cbonsai"
      "docker-compose"
      "lua"
      "luarocks"
      "mas"
      "maven"
      "starship"
      "tree-sitter-cli"
      "tty-clock"
      "webp"
    ];
    casks = [
      "boom-3d"
      "caffeine"
      "calibre"
      "cursor"
      "discord"
      "docker-desktop"
      "dropbox@beta"
      "evernote"
      "font-monaspace"
      "ghostty"
      "istat-menus"
      "logi-options+"
      "notunes"
      "obsidian"
      "openmtp"
      "postman"
      "postman-cli"
      "quickmd"
      "spotify"
      "steam"
      "tailscale-app"
      "tor-browser"
      "visual-studio-code"
      "zed"
    ];
  };
}
