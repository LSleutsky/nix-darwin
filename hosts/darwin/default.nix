{ config, lib, pkgs, ... }:

{
  imports = [
    ./services/homebrew.nix
  ];

  security.pam.enableSudoTouchIdAuth = true;
  services.nix-daemon.enable = true;
  time.timeZone = "America/New_York";

  nix = {
    gc = {
      user = "root";
      automatic = true;
      interval = {
        Weekday = 0;
        Hour = 3;
        Minute = 0;
      };
      options = "--delete-old";
    };
    settings = {
      auto-optimise-store = true;
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

  users.users.lushsleutsky = {
    description = "Lush Sleutsky";
    home = "/Users/lushsleutsky";
    shell = pkgs.zsh;
  };

  fonts = {
    fontDir.enable = true;
    fonts = with pkgs; [
      (nerdfonts.override {
        fonts = [
          "ComicShannsMono"
          "FiraCode"
          "Hack"
          "JetBrainsMono"
          "Mononoki"
          "RobotoMono"
        ];
      })
    ];
  };

  system.defaults = {
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
      "com.apple.SoftwareUpdate" = {
        AutomaticCheckEnabled = false;
        ScheduleFrequency = 0;
        AutomaticDownload = 0;
        CriticalUpdateInstall = 0;
      };
    };
    NSGlobalDomain = {
      AppleShowAllExtensions = true;
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
      _FXShowPosixPathInTitle = true;
    };
  };
}
