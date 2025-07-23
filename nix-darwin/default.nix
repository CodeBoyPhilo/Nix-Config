{
  config,
  hostname,
  inputs,
  lib,
  outputs,
  pkgs,
  platform,
  username,
  ...
}:
{
  imports = [
    inputs.nix-homebrew.darwinModules.nix-homebrew
    ./${hostname}
    ./modules/appearance
    ./modules/booster
    ./modules/creativity
    ./modules/social
  ];

  # Only install the docs I use
  documentation.enable = true;
  documentation.doc.enable = false;
  documentation.info.enable = false;
  documentation.man.enable = true;

  environment = {
    shells = [ pkgs.fish ];
    systemPackages = with pkgs; [
      git
      mas
    ];

    variables = {
      EDITOR = "nvim";
    };
  };

  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      upgrade = true;
      cleanup = "zap";
    };
  };

  nix-homebrew = {
    enable = true;
    enableRosetta = if (platform == "aarch64-darwin") then true else false;
    autoMigrate = true;
    user = "${username}";
    mutableTaps = true;
  };

  nixpkgs = {
    config.allowUnfree = true;
    hostPlatform = lib.mkDefault "${platform}";
  };

  nix =
    let
      flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
    in
    {
      settings = {
        # Disable global registry
        flake-regisstry = "";
        # Workaround for https://github.com/NixOS/nix/issues/9574
        nix-path = config.nix.nixPath;
        warn-dirty = false;
      };
      # Determinate uses its own daemon to manage the Nix installation that
      # conflicts with nix-darwin’s native Nix management.
      enable = false;
      # Disable channels
      channel.enable = false;
      # Make flake registry and nix path match flake inputs
      registry = lib.mapAttrs (_: flake: { inherit flake; }) flakeInputs;
      nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
    };

  networking.hostName = hostname;
  networking.computerName = hostname;

  # Enable TouchID for sudo authentication
  security.pam.services.sudo_local.touchIdAuth = true;

  system = {

    stateVersion = 6;
    primaryUser = "phil_oh";

    defaults = {
      CustomUserPreferences = {
        "com.apple.AdLib" = {
          allowApplePersonalizedAdvertising = false;
        };
        "com.apple.controlcenter" = {
          BatteryShowPercentage = true;
        };
        "com.apple.desktopservices" = {
          # Avoid creating .DS_Store files on network or USB volumes
          DSDontWriteNetworkStores = true;
          DSDontWriteUSBStores = true;
        };
        # Prevent Photos from opening automatically
        "com.apple.ImageCapture".disableHotPlug = true;
        "com.apple.screencapture" = {
          location = "~/Pictures/Screenshots";
          type = "png";
        };
        "com.apple.SoftwareUpdate" = {
          AutomaticCheckEnabled = true;
          # Check for software updates daily, not just once per week
          ScheduleFrequency = 1;
          # Download newly available updates in background
          AutomaticDownload = 0;
          # Install System data files & security updates
          CriticalUpdateInstall = 1;
        };
        "com.apple.TimeMachine".DoNotOfferNewDisksForBackup = true;
        # Turn on app auto-update
        "com.apple.commerce".AutoUpdate = true;

      };

      NSGlobalDomain = {
        AppleICUForce24HourTime = true;
        AppleInterfaceStyle = "Dark";
        AppleMeasurementUnits = "Centimeters";
        AppleMetricUnits = 1;
        AppleShowScrollBars = "Always";
        AppleTemperatureUnit = "Celsius";
        AppleWindowTabbingMode = "manual";
        InitialKeyRepeat = 15;
        KeyRepeat = 2;
        NSDocumentSaveNewDocumentsToCloud = false;
        NSNavPanelExpandedStateForSaveMode = true;
        NSNavPanelExpandedStateForSaveMode2 = true;
        _HIHideMenuBar = true;
        "com.apple.sound.beep.feedback" = 0;
      };

      dock = {
        orientation = "bottom";
        autohide = true;
        persistent-apps = [
          "/System/Applications/Launchpad.app"
          "/Applications/Ghostty.app"
          "/Applications/Zotero.app"
          "/Applications/WeChat.app"
          "/Applications/Microsoft Outlook.app"
          "/Applications/Obsidian.app"
        ];
        show-recents = false;
        tilesize = 48;
        wvous-bl-corner = 1;
        wvous-br-corner = 1;
        wvous-tl-corner = 1;
        wvous-tr-corner = 1;
      };
      finder = {
        AppleShowAllExtensions = true;
        AppleShowAllFiles = true;
        FXDefaultSearchScope = "SCcf";
        FXPreferredViewStyle = "Nlsv";
        FXRemoveOldTrashItems = true;
        NewWindowTarget = "Desktop";
        ShowExternalHardDrivesOnDesktop = true;
        ShowHardDrivesOnDesktop = true;
        ShowMountedServersOnDesktop = true;
        ShowPathbar = true;
        ShowStatusBar = true;
        _FXShowPosixPathInTitle = true;
        _FXSortFoldersFirst = true;
        _FXSortFoldersFirstOnDesktop = true;
      };
      screensaver = {
        askForPassword = true;
        askForPasswordDelay = 300;
      };
      WindowManager = {
        StandardHideDesktopIcons = true;
      };
    };
  };
}
