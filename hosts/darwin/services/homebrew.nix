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
      "istat-menus"
      "logi-options-plus"
      "notunes"
      "slack"
      "spotify"
      "visual-studio-code"
    ];
		masApps = {
			"Amphetamine" = 937984704;
			"myPoint Light S" = 518658487;
		};
  };
}
