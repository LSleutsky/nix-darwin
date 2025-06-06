{ config, lib, pkgs, ... }:

{
  imports = [
    ./services/homebrew.nix
  ];

  security.pam.services.sudo_local.touchIdAuth = true;
  time.timeZone = "America/New_York";

  nix = {
    gc = {
      automatic = true;
      interval = {
        Weekday = 0;
        Hour = 3;
        Minute = 0;
      };
      options = "--delete-old";
    };
    settings = {
      trusted-users = ["@admin"];
      experimental-features = ["nix-command" "flakes"];
    };
  };

  environment = {
    darwinConfig = "$HOME/.config/nix-darwin/configuration.nix";
    shells = with pkgs; [bashInteractive zsh];
    variables = {
      EDITOR = "nvim";
			NIXPKGS_ALLOW_BROKEN = "1";
			NIXPKGS_ALLOW_UNSUPPORTED_SYSTEM = "1";
      SUDO_EDITOR = "nvim";
      PAGER = "less";
    };
  };

  programs = {
    man.enable = true;
    nix-index.enable = true;
    zsh = {
      enable = true;
      enableBashCompletion = true;
      enableCompletion = true;
      enableSyntaxHighlighting = true;
    };
  };

  users.users.lush = {
    description = "Lush Sleutsky";
    home = "/Users/lush";
    shell = pkgs.zsh;
  };

  fonts = {
    packages = with pkgs; [
      nerd-fonts.comic-shanns-mono
      nerd-fonts.fira-code
      nerd-fonts.hack
      nerd-fonts.jetbrains-mono
      nerd-fonts.mononoki
      nerd-fonts.roboto-mono
    ];
  };

  system = {
    defaults = {
      CustomUserPreferences = {
        NSGlobalDomain.WebKitDeveloperExtras = true;
			  "com.apple.desktopservices" = {
				  DSDontWriteNetworkStores = true;
				  DSDontWriteUSBStores = true;
			  };
        "com.apple.finder" = {
          ShowExternalHardDrivesOnDesktop = false;
          ShowHardDrivesOnDesktop = false;
          ShowMountedServersOnDesktop = false;
          ShowRemovableMediaOnDesktop = true;
          FXDefaultSearchScope = "SCcf";
          _FXSortFoldersFirst = true;
        };
        "com.apple.print.PrintingPrefs" = {
          "Quit When Finished" = true;
        };
        "com.apple.security.authorization" = {
          # for DisplayLink sudo auth prompt
          ignoreArd = true;
        };
        "com.apple.SoftwareUpdate" = {
          AutomaticCheckEnabled = false;
          ScheduleFrequency = 0;
          AutomaticDownload = 0;
          CriticalUpdateInstall = 0;
        };
        "digital.twisted.noTunes" = {
          replacement = "/Applications/Spotify.app";
        };
      };
      NSGlobalDomain = {
        AppleShowAllExtensions = true;
			  AppleShowAllFiles = true;
        AppleEnableSwipeNavigateWithScrolls = true;
        ApplePressAndHoldEnabled = false;
        AppleInterfaceStyle = "Dark";
        InitialKeyRepeat = 14;
        KeyRepeat = 1;
      };
      dock = {
        autohide = true;
        autohide-delay = 0.0;
        autohide-time-modifier = 0.2;
        expose-animation-duration = 0.2;
        launchanim = true;
        showhidden = true;
        show-recents = false;
        show-process-indicators = true;
        orientation = "bottom";
      };
      finder = {
        AppleShowAllExtensions = true;
			  ShowPathbar = true;
			  ShowStatusBar = true;
        _FXShowPosixPathInTitle = true;
      };
		  loginwindow = {
			  GuestEnabled = false;
		  };
		  trackpad = {
			  Clicking = true;
			  TrackpadRightClick = true;
			  TrackpadThreeFingerDrag = true;
		  };
    };
    stateVersion = 4;
  };
}
