{ inputs, lib, ... }:{

  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia-shell = {
    enable = true;
    settings = {
      ui = {
          fontDefault = lib.mkForce "Maple Mono NF";
          fontFixed = lib.mkForce"Maple Mono NF";
      };
      settingsVersion = 53;
      general = {
          radiusRatio = 0.25;
          iRadiusRatio = 0.15;
          boxRadiusRatio = 1;
          screenRadiusRatio = 1;
      };
      bar = {
        barType = "floating";
        density = "compact";
        position = "top";
        showCapsule = true;
        hideOnOverview = false;
        marginVertical = 7;
        marginHorizontal = 25;
        widgets = {
          left = [
            {
              id = "SystemMonitor";
            }
          ];
          center = [
            {
              hideUnoccupied = false;
              id = "Workspace";
              labelMode = "name";
              characterCount = "7";
              showApplications = true;
              showApplicationsWhenHovered = true;
              showApplicationsHover =true;
              showBadge = false;
            }
          ];
          right = [
            {
              id = "Tray";
            }
            {
              id = "NotificationHistory";
            }
            {
              id = "Volume";
            }
            {
              id = "Brightness";
            }
            {
              id = "PrivacyIndicator";
            }
            {
              id = "Clock";
            }
          ];
        };
      };
      dock = {
        enabled = false;
      };
      network = {
          bluetoothRssiPollingEnabled = false;
          bluetoothRssiPollIntervalMs = 60000;
          networkPanelView = "wifi";
          wifiDetailsViewMode = "grid";
          bluetoothDetailsViewMode = "grid";
          bluetoothHideUnnamedDevices = false;
          disableDiscoverability = false;
          bluetoothAutoConnect = true;
      };
      sessionMenu = {
          enableCountdown = true;
          countdownDuration = 5000;
          position = "center";
          showHeader = true;
          showKeybinds = true;
          largeButtonsStyle = true;
          largeButtonsLayout = "single-row";
          powerOptions = [
            {
              action = "reboot";
              enabled = true;
              keybind = "1";
            }
            {
              action = "logout";
              enabled = true;
              keybind = "2";
            }
            {
              action = "shutdown";
              enabled = true;
              keybind = "3";
            }
            {
              action = "rebootToUefi";
              enabled = true;
              keybind = "4";
            }
          ];
        };
      wallpaper = {
        enabled = false;
        overviewEnabled = true;
        setWallpaperOnAllMonitors = true;
        directory = "~/nixos-dotfiles/nixpics/Wallpapers/";
        skipStartupTransition = false;
        transitionEdgeSmoothness = 0.05;
        panelPosition = "follow_bar";
        hideWallpaperFilenames = false;
        useOriginalImages = true;
        overviewBlur = 0.4;
        overviewTint = 0.1;
         transitionType = [
            "pixelate"
          ];
        };
      notifications = {
        enableKeyboardLayoutToast = false;
      };
      desktopWidgets = {
        enabled = true;
        gridSnap =  true;
        gridSnapScale = false;
        monitorWidgets = [
            {
              name = "eDP-1";
                widgets = [
                    {
                      colorName = "secondary";
                      height = 72;
                      hideWhenIdle = true;
                      id = "AudioVisualizer";
                      roundedCorners = true;
                      scale = 1;
                      showBackground = false;
                      visualizerType= "linear";
                      width = 666;
                      x = 640;
                      y = 1000;
                    }
                ];
            }
        ];
        overviewEnabled = true;
    };
     # plugins = {
     #   sources = [
     #     {
     #       enabled = true;
     #       name = "Noctalia Plugins";
     #       url = "https://github.com/noctalia-dev/noctalia-plugins";
     #     }
     #   ];
     #   states = {
     #     video-wallpaper = {
     #       enabled = true;
     #       sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
     #     };
     #   };
     #   version = 2;
     # };
     # pluginSettings = {
     #   video-wallpaper = {
     #    activeBackend = "mpvpaper";
     #     automationMode =  "random";
     #     volume = 0;
     #     wallpapersFolder = "~/Pictures/Wallpapers/";
     #     thumbCacheReady = true;
     #     enabled = true;
     #   };
     #};
    };
  };
   stylix.targets.noctalia-shell.enable = true;
}
