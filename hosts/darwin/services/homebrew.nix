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
      "istat-menus"
      "logi-options-plus"
      "notunes"
      "slack"
    ];
		masApps = {
			"Amphetamine" = 937984704;
			"myPoint Light S" = 518658487;
		};
  };
}
