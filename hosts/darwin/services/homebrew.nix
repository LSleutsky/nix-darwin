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
    brews = [
      "arp-scan"
      "cbonsai"
      "docker-compose"
      "lua"
      "luarocks"
      "mas"
      "maven"
      "tree-sitter-cli"
      "tty-clock"
      "webp"
    ];
    casks = [
      "boom-3d"
      "calibre"
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
      "spotify"
      "steam"
      "tailscale-app"
      "tor-browser"
      "visual-studio-code"
      "zed"
    ];
  };
}
