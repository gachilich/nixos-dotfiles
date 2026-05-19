{ config, ... }:

let
  A = config.lib.niri.actions;
in
{
  programs.niri.settings = {

    cursor = {
      theme = "BreezeX-RosePine-Linux";
      size = 30;
    };

    # ── Autostart ────────────────────────────────────────────────────────────
    spawn-at-startup = [
      { command = [ "noctalia-shell" ]; }
      { command = [ "zen-twilight" ]; }
      { command = [ "spotify" ]; }
      { command = [ "vesktop" ]; }
      { command = ["vicine" "server"]; }
      { command = ["awww-daemon" ]; }
    ];

    prefer-no-csd = true;

    screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

    # NOTE: top-level `blur {}` (global blur defaults) is not exposed in
    # niri-flake settings. Defaults: passes=3 offset=3.0 noise=0.02
    # saturation=1.5. To override, you must use programs.niri.config (raw KDL)
    # instead of programs.niri.settings.

    # ── Named Workspaces ─────────────────────────────────────────────────────
    workspaces = {
      "browser" = { };
      "DiSpot"  = { };
    };

    # ── Layer Rules ──────────────────────────────────────────────────────────
  layer-rules = [
  #    {
  #      matches = [
  #        { layer = "top"; }
  #        { layer = "overlay"; }
  #      ];
  #      background-effect.xray = false;
  #    }
  #    {
  #      matches = [{ namespace = "^launcher$"; }];
  #      background-effect = {
  #        blur = true;
  #        xray = false;
  #      };
  #    }
      {
        matches = [{ namespace = "^awww-daemon"; }];
      }
    ];
    # ── Window Rules ─────────────────────────────────────────────────────────
    window-rules = [
      {
        matches = [{ app-id = "zen-twilight"; }];
        open-on-workspace = "browser";
        open-maximized    = true;
      }
      {
        matches = [{ app-id = "vesktop"; }];
        open-on-workspace = "DiSpot";
      }
      {
        matches = [{ title = "Spotify"; }];
        open-on-workspace = "DiSpot";
      }
      {
        matches = [{ app-id = "steam"; }];
        open-maximized = true;
      }
      {
        matches = [{ app-id = "REAPER"; }];
        open-maximized = true;
      }
      {
        matches = [{ app-id = ''^org\.wezfurlong\.wezterm$''; }];
        default-column-width = { };
      }
      {
        matches = [
          { title = "Zen Browser"; }
          { title = "^Picture-in-Picture$"; }
        ];
        open-floating = true;
      }
      {
      clip-to-geometry = true;
      }
      {
      geometry-corner-radius = {
        bottom-left = 4.0;
        bottom-right = 4.0;
        top-left = 4.0;
        top-right = 4.0;
      };
      }
     ];

    # ── Input ────────────────────────────────────────────────────────────────
    input = {
      keyboard = {
        xkb = {
          layout  = "us,ru";
          options = "grp:win_space_toggle,compose:ralt,ctrl:nocaps";
        };
        numlock = true;
      };

      touchpad = {
        tap            = true;
        natural-scroll = true;
      };

      focus-follows-mouse = {
        enable            = true;
        max-scroll-amount = "25%";
      };
    };

    # ── Outputs ──────────────────────────────────────────────────────────────
    outputs = {
      "eDP-1" = {
        mode = {
          width   = 1920;
          height  = 1080;
          refresh = 144.003;
        };
        scale    = 1.0;
        position = { x = 0; y = 0; };
      };
      "HDMI-A-1" = {
        mode = {
          width   = 1920;
          height  = 1080;
          refresh = 60.0;
        };
        scale    = 1.0;
        position = { x = -1920; y = 0; };
      };
    };

    # ── Layout ───────────────────────────────────────────────────────────────
    layout = {
      gaps = 10;
      center-focused-column = "never";

      preset-column-widths = [
        { proportion = 0.33333; }
        { proportion = 0.5; }
        { proportion = 0.66667; }
      ];

      default-column-width = { proportion = 0.5; };

      focus-ring = {
        width          = 0;
       # active.color   = "#a63650";
       # inactive.color = "#6d4745";
      };

      border = {
        enable         = true;
        width          = 1.5;
       # active.color   = "#a63650";
       # inactive.color = "#6d4745";
       # urgent.color   = "#cdd6f4";
      };

      shadow = {
        enable   = true;
        softness = 30;
        spread   = 5;
        offset   = { x = 0; y = 5; };
       # color    = "#0007";
      };
    };

    hotkey-overlay = { };

    # ── Animations ───────────────────────────────────────────────────────────
    animations = {
      workspace-switch.kind.spring = {
        damping-ratio = 1.0;
        stiffness     = 1000;
        epsilon       = 0.0001;
      };
      window-open.kind.easing = {
        duration-ms = 450;
        curve       = "ease-out-expo";
      };
      window-close.kind.easing = {
        duration-ms = 250;
        curve       = "ease-out-quad";
      };
      window-resize.kind.spring = {
        damping-ratio = 1.0;
        stiffness     = 800;
        epsilon       = 0.0001;
      };
      overview-open-close.kind.spring = {
        damping-ratio = 1.0;
        stiffness     = 800;
        epsilon       = 0.0001;
      };
    };

    # ── Binds ────────────────────────────────────────────────────────────────
    binds = with A; {

      # Settings / overlay
      "Mod+S".action.spawn     = [ "dms" "settings" ];
      "Mod+Shift+Slash".action = show-hotkey-overlay;

      # App launchers
      "Mod+Return" = {
        hotkey-overlay.title = "Open a Terminal: kitty";
        action.spawn   = "kitty";
      };
      "Mod+D" = {
        hotkey-overlay.title = "Run an Application: vicinae";
        action.spawn   = ["vicinae" "toggle"];
      };
      "Super+Alt+L" = {
        hotkey-overlay.title = "Lock the Screen: tuigreet";
        action.spawn   = "tuigreet";
      };
      "Super+Alt+S" = {
        allow-when-locked = true;
        hotkey-overlay.hidden = true;
        action.spawn-sh   = "pkill orca || exec orca";
      };

      # Audio
      "XF86AudioRaiseVolume" = {
        allow-when-locked = true;
        action.spawn-sh   = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+ -l 1.0";
      };
      "XF86AudioLowerVolume" = {
        allow-when-locked = true;
        action.spawn-sh   = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-";
      };
      "XF86AudioMute" = {
        allow-when-locked = true;
        action.spawn-sh   = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
      };
      "XF86AudioMicMute" = {
        allow-when-locked = true;
        action.spawn-sh   = "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle";
      };

      # Media
      "XF86AudioPlay" = { allow-when-locked = true; action.spawn-sh = "playerctl play-pause"; };
      "XF86AudioStop" = { allow-when-locked = true; action.spawn-sh = "playerctl stop"; };
      "XF86AudioPrev" = { allow-when-locked = true; action.spawn-sh = "playerctl previous"; };
      "XF86AudioNext" = { allow-when-locked = true; action.spawn-sh = "playerctl next"; };

      # Brightness
      "XF86MonBrightnessUp" = {
        allow-when-locked = true;
        action.spawn      = [ "brightnessctl" "--class=backlight" "set" "+10%" ];
      };
      "XF86MonBrightnessDown" = {
        allow-when-locked = true;
        action.spawn      = [ "brightnessctl" "--class=backlight" "set" "10%-" ];
      };

      # Overview / close
      "Mod+O" = { repeat = false; action = toggle-overview; };
      "Mod+Q" = { repeat = false; action = close-window; };

      # Focus navigation
      "Mod+Left".action  = focus-column-left;
      "Mod+Down".action  = focus-window-down;
      "Mod+Up".action    = focus-window-up;
      "Mod+Right".action = focus-column-right;
      "Mod+H".action     = focus-column-left;
      "Mod+J".action     = focus-window-down;
      "Mod+K".action     = focus-window-up;
      "Mod+L".action     = focus-column-right;

      # Move columns / windows
      "Mod+Ctrl+Left".action  = move-column-left;
      "Mod+Ctrl+Down".action  = move-window-down;
      "Mod+Ctrl+Up".action    = move-window-up;
      "Mod+Ctrl+Right".action = move-column-right;
      "Mod+Ctrl+H".action     = move-column-left;
      "Mod+Ctrl+J".action     = move-window-down;
      "Mod+Ctrl+K".action     = move-window-up;
      "Mod+Ctrl+L".action     = move-column-right;

      # First / last column
      "Mod+Home".action      = focus-column-first;
      "Mod+End".action       = focus-column-last;
      "Mod+Ctrl+Home".action = move-column-to-first;
      "Mod+Ctrl+End".action  = move-column-to-last;

      # Focus monitor
      "Mod+Shift+Left".action  = focus-monitor-left;
      "Mod+Shift+Down".action  = focus-monitor-down;
      "Mod+Shift+Up".action    = focus-monitor-up;
      "Mod+Shift+Right".action = focus-monitor-right;
      "Mod+Shift+H".action     = focus-monitor-left;
      "Mod+Shift+J".action     = focus-monitor-down;
      "Mod+Shift+K".action     = focus-monitor-up;
      "Mod+Shift+L".action     = focus-monitor-right;

      # Move column to monitor
      "Mod+Shift+Ctrl+Left".action  = move-column-to-monitor-left;
      "Mod+Shift+Ctrl+Down".action  = move-column-to-monitor-down;
      "Mod+Shift+Ctrl+Up".action    = move-column-to-monitor-up;
      "Mod+Shift+Ctrl+Right".action = move-column-to-monitor-right;
      "Mod+Shift+Ctrl+H".action     = move-column-to-monitor-left;
      "Mod+Shift+Ctrl+J".action     = move-column-to-monitor-down;
      "Mod+Shift+Ctrl+K".action     = move-column-to-monitor-up;
      "Mod+Shift+Ctrl+L".action     = move-column-to-monitor-right;

      # Workspace navigation
      "Mod+Page_Down".action      = focus-workspace-down;
      "Mod+Page_Up".action        = focus-workspace-up;
      "Mod+U".action              = focus-workspace-down;
      "Mod+I".action              = focus-workspace-up;
      "Mod+Ctrl+Page_Down".action = move-column-to-workspace-down;
      "Mod+Ctrl+Page_Up".action   = move-column-to-workspace-up;
      "Mod+Ctrl+U".action         = move-column-to-workspace-down;
      "Mod+Ctrl+I".action         = move-column-to-workspace-up;

      # Move workspace
      "Mod+Shift+Page_Down".action = move-workspace-down;
      "Mod+Shift+Page_Up".action   = move-workspace-up;
      "Mod+Shift+U".action         = move-workspace-down;
      "Mod+Shift+I".action         = move-workspace-up;

      # Scroll → workspace
      "Mod+WheelScrollDown"      = { cooldown-ms = 150; action = focus-workspace-down; };
      "Mod+WheelScrollUp"        = { cooldown-ms = 150; action = focus-workspace-up; };
      "Mod+Ctrl+WheelScrollDown" = { cooldown-ms = 150; action = move-column-to-workspace-down; };
      "Mod+Ctrl+WheelScrollUp"   = { cooldown-ms = 150; action = move-column-to-workspace-up; };

      # Scroll → column
      "Mod+WheelScrollRight".action      = focus-column-right;
      "Mod+WheelScrollLeft".action       = focus-column-left;
      "Mod+Ctrl+WheelScrollRight".action = move-column-right;
      "Mod+Ctrl+WheelScrollLeft".action  = move-column-left;

      "Mod+Shift+WheelScrollDown".action      = focus-column-right;
      "Mod+Shift+WheelScrollUp".action        = focus-column-left;
      "Mod+Ctrl+Shift+WheelScrollDown".action = move-column-right;
      "Mod+Ctrl+Shift+WheelScrollUp".action   = move-column-left;

      # Focus workspace by index
      "Mod+1".action.focus-workspace = 1;
      "Mod+2".action.focus-workspace = 2;
      "Mod+3".action.focus-workspace = 3;
      "Mod+4".action.focus-workspace = 4;
      "Mod+5".action.focus-workspace = 5;
      "Mod+6".action.focus-workspace = 6;
      "Mod+7".action.focus-workspace = 7;
      "Mod+8".action.focus-workspace = 8;
      "Mod+9".action.focus-workspace = 9;

      # Move column to workspace by index
      "Mod+Ctrl+1".action.move-column-to-workspace = 1;
      "Mod+Ctrl+2".action.move-column-to-workspace = 2;
      "Mod+Ctrl+3".action.move-column-to-workspace = 3;
      "Mod+Ctrl+4".action.move-column-to-workspace = 4;
      "Mod+Ctrl+5".action.move-column-to-workspace = 5;
      "Mod+Ctrl+6".action.move-column-to-workspace = 6;
      "Mod+Ctrl+7".action.move-column-to-workspace = 7;
      "Mod+Ctrl+8".action.move-column-to-workspace = 8;
      "Mod+Ctrl+9".action.move-column-to-workspace = 9;

      # Column manipulation
      "Mod+BracketLeft".action  = consume-or-expel-window-left;
      "Mod+BracketRight".action = consume-or-expel-window-right;
      "Mod+Comma".action        = consume-window-into-column;
      "Mod+Period".action       = expel-window-from-column;

      # Column / window sizing
      "Mod+R".action       = switch-preset-column-width;
      "Mod+Shift+R".action = switch-preset-window-height;
      "Mod+Ctrl+R".action  = reset-window-height;
      "Mod+F".action       = maximize-column;
      "Mod+Shift+F".action = fullscreen-window;
      "Mod+Ctrl+F".action  = expand-column-to-available-width;
      "Mod+C".action       = center-column;
      "Mod+Ctrl+C".action  = center-visible-columns;

      "Mod+Minus".action.set-column-width        = "-10%";
      "Mod+Equal".action.set-column-width         = "+10%";
      "Mod+Shift+Minus".action.set-window-height  = "-10%";
      "Mod+Shift+Equal".action.set-window-height  = "+10%";

      # Floating
      "Mod+V".action       = toggle-window-floating;
      "Mod+Shift+V".action = switch-focus-between-floating-and-tiling;

      # Tabbed column
      "Mod+W".action = toggle-column-tabbed-display;

      # Screenshots
      # `screenshot-screen` / `screenshot-window` are not exported in
      # config.lib.niri.actions, so use the raw attrset form.
      "Print".action.screenshot               = [];
      "Ctrl+Print".action."screenshot-screen" = [];
      "Alt+Print".action."screenshot-window"  = [];

      # Misc
      "Mod+Escape" = {
        allow-inhibiting = false;
        action           = toggle-keyboard-shortcuts-inhibit;
      };
      "Mod+Shift+E".action     = quit;
      "Ctrl+Alt+Delete".action = quit;
      "Mod+Shift+P".action     = power-off-monitors;
    };
    debug = {
      honor-xdg-activation-with-invalid-serial = true;
    };
  };
}
