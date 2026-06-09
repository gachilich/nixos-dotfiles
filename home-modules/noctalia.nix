{ inputs, lib, ... }:
{
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia = {
    enable = true;
  #  settings = {
  #    ui = {
  #      fontDefault = "Maple Mono NF";
  #      fontFixed = "Maple Mono NF";
  #    };
  #    settingsVersion = 53;
  #    general = {
  #      radiusRatio = 0.25;
  #      iRadiusRatio = 0.15;
  #      boxRadiusRatio = 1;
  #      animationSpeed = 0.75;
  #      screenRadiusRatio = 1;
  #    };
  #    bar = {
  #      barType = "floating";
  #      density = "compact";
  #      position = "top";
  #      showCapsule = true;
  #      hideOnOverview = false;
  #      marginVertical = 10;
  #      marginHorizontal = 25;
  #      widgets = {
  #        left = [
  #          {
  #            id = "SystemMonitor";
  #          }
  #          {
  #            id = "plugin:screen-toolkit";
  #          }
  #          {
  #            id = "CustomButton";
  #            generalTooltipText = "Theme Switcher";
  #            icon = "moon-filled";
  #            leftClickExec = "switch-theme dark";
  #            rightClickExec = "switch-theme light";
  #          }
  #        ];
  #        center = [
  #          {
  #            hideUnoccupied = false;
  #            id = "Workspace";
  #            labelMode = "name";
  #            characterCount = "7";
  #            showApplications = false;
  #            showApplicationsWhenHovered = true;
  #            showApplicationsHover = true;
  #            showBadge = false;
  #            colorizeIcons = false;
  #            iconScaling = 1;
  #          }
  #          {
  #            id = "plugin:mangowc-layout-switcher";
  #          }
  #        ];
  #        right = [
  #          {
  #            id = "Tray";
  #            colorizeIcons = true;
  #          }
  #          {
  #            id = "NotificationHistory";
  #          }
  #          {
  #            id = "Volume";
  #          }
  #          {
  #            id = "Brightness";
  #          }
  #          {
  #            id = "PrivacyIndicator";
  #          }
  #          {
  #            id = "Clock";
  #          }
  #        ];
  #      };
  #    };
  #    dock = {
  #      enabled = false;
  #    };
  #    network = {
  #      bluetoothRssiPollingEnabled = false;
  #      bluetoothRssiPollIntervalMs = 60000;
  #      networkPanelView = "wifi";
  #      wifiDetailsViewMode = "grid";
  #      bluetoothDetailsViewMode = "grid";
  #      bluetoothHideUnnamedDevices = false;
  #      disableDiscoverability = false;
  #      bluetoothAutoConnect = true;
  #    };
  #    sessionMenu = {
  #      enableCountdown = true;
  #      countdownDuration = 5000;
  #      position = "center";
  #      showHeader = true;
  #      showKeybinds = true;
  #      largeButtonsStyle = true;
  #      largeButtonsLayout = "single-row";
  #      powerOptions = [
  #        {
  #          action = "reboot";
  #          enabled = true;
  #          keybind = "1";
  #        }
  #        {
  #          action = "logout";
  #          enabled = true;
  #          keybind = "2";
  #        }
  #        {
  #          action = "shutdown";
  #          enabled = true;
  #          keybind = "3";
  #        }
  #        {
  #          action = "rebootToUefi";
  #          enabled = true;
  #          keybind = "4";
  #        }
  #      ];
  #    };
  #    wallpaper = {
  #      enabled = false;
  #      overviewEnabled = true;
  #      setWallpaperOnAllMonitors = true;
  #      directory = "~/nixos-dotfiles/nixpics/Wallpapers/";
  #      skipStartupTransition = false;
  #      transitionEdgeSmoothness = 0.05;
  #      panelPosition = "follow_bar";
  #      hideWallpaperFilenames = false;
  #      useOriginalImages = true;
  #      overviewBlur = 0.4;
  #      overviewTint = 0.1;
  #      transitionType = [
  #        "pixelate"
  #      ];
  #    };
  #    notifications = {
  #      enableKeyboardLayoutToast = false;
  #    };
  #    desktopWidgets = {
  #      enabled = true;
  #      gridSnap = true;
  #      gridSnapScale = false;
  #      monitorWidgets = [
  #        {
  #          name = "eDP-1";
  #          widgets = [
  #            {
  #              colorName = "secondary";
  #              height = 72;
  #              hideWhenIdle = true;
  #              id = "AudioVisualizer";
  #              roundedCorners = true;
  #              scale = 1;
  #              showBackground = false;
  #              visualizerType = "linear";
  #              width = 700;
  #              x = 625;
  #              y = 1000;
  #            }
  #          ];
  #        }
  #        {
  #          name = "HDMI-A-1";
  #          widgets = [
  #            {
  #              colorName = "secondary";
  #              height = 72;
  #              hideWhenIdle = true;
  #              id = "AudioVisualizer";
  #              roundedCorners = true;
  #              scale = 1;
  #              showBackground = false;
  #              visualizerType = "linear";
  #              width = 700;
  #              x = 625;
  #              y = 1000;
  #            }
  #          ];
  #        }
  #      ];
  #      overviewEnabled = true;
  #    };
  #    plugins = {
  #      sources = [
  #        {
  #          enabled = true;
  #          name = "Noctalia Plugins";
  #          url = "https://github.com/noctalia-dev/noctalia-plugins";
  #        }
  #      ];
  #      states = {
  #        screenToolkit = {
  #          enabled = true;
  #          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
  #        };
  #        mangowcLayoutSwitcher = {
  #          enabled = true;
  #          sourceUrl = "https://github.com/noctalia-dev/noctalia-plugins";
  #        };
  #      };
  #      version = 2;
  #    };
  #  };
  };

  stylix.targets.noctalia-shell.enable = true;
}
