{ ... }:
{

  programs.niri = {

    settings = {

      screenshot-path = "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png";

      prefer-no-csd = true;

      # ── Cursor ────────────────────────────────────────────────────────────
      cursor = {
        theme = "BreezeX-RosePine-Linux";
        size   = 30;
      };

      # ── Input ─────────────────────────────────────────────────────────────
      input = {
        keyboard = {
          xkb = {
            layout  = "us,ru";
            options = "grp:win_space_toggle,compose:ralt,ctrl:nocaps";
          };
          repeat-delay  = 600;
          repeat-rate   = 25;
          track-layout  = "global";
          numlock       = true;
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

      # ── Outputs ───────────────────────────────────────────────────────────
      outputs = {
        "HDMI-A-1" = {
          scale     = 1.0;
          transform.rotation = 0;
          position  = { x = -1920; y = 0; };
          mode      = { width = 1920; height = 1080; refresh = 60.0; };
        };
        "eDP-1" = {
          scale     = 1.0;
          transform.rotation = 0;
          position  = { x = 0; y = 0; };
          mode      = { width = 1920; height = 1080; refresh = 144.003; };
        };
      };

      # ── Layout ────────────────────────────────────────────────────────────
      layout = {
        gaps   = 10;
        struts = { left = 0; right = 0; top = 0; bottom = 0; };

        focus-ring.enable = false;

        border = {
          enable         = true;
          width          = 1.5;
          active.color   = "#45707a";
          inactive.color = "#a89984";
        };

        shadow = {
          enable             = true;
          offset             = { x = 0; y = 5; };
          softness           = 30;
          spread             = 5;
          draw-behind-window = false;
          color              = "#00000070";
        };

        default-column-width.proportion = 0.5;

        preset-column-widths = [
          { proportion = 0.33333; }
          { proportion = 0.5; }
          { proportion = 0.66667; }
        ];

        center-focused-column = "never";
      };

      # ── Workspaces ────────────────────────────────────────────────────────
      workspaces = {
        "01-DiSpot"  = { name = "DiSpot"; };
        "02-browser" = { name = "browser"; };
      };

      # ── Spawn at startup ──────────────────────────────────────────────────
      spawn-at-startup = [
        { command = [ "noctalia" ]; }
        { command = [ "zen-twilight" ]; }
        { command = [ "spotify" ]; }
        { command = [ "vesktop" ]; }
        { command = [ "vicine" "server" ]; }
        { command = [ "awww-daemon" ]; }
        { command = [ "awww-daemon" "--namespace" "backdrop" ]; }
      ];

      # ── Animations ────────────────────────────────────────────────────────
      # Структура: animations.<name>.kind = { easing = {...}; } или { spring = {...}; }
      # Тип: attribute-tagged union — нельзя смешивать easing и spring в одном блоке.
      animations = {
        window-open = {
          kind.easing = {
            duration-ms = 650;
            curve       = "cubic-bezier";
            curve-args  = [ 0.16 1.0 0.3 1.0 ];
          };
        };
        window-close = {
          kind.easing = {
            duration-ms = 550;
            curve       = "cubic-bezier";
            curve-args  = [ 0.08 0.92 0.0 1.0 ];
          };
        };
        window-movement = {
          kind.easing = {
            duration-ms = 750;
            curve       = "cubic-bezier";
            curve-args  = [ 0.46 1.0 0.29 1.0 ];
          };
        };
        window-resize = {
          kind.spring = {
            damping-ratio = 1.0;
            epsilon       = 0.0001;
            stiffness     = 800;
          };
        };
        workspace-switch = {
          kind.easing = {
            duration-ms = 550;
            curve       = "cubic-bezier";
            curve-args  = [ 0.46 1.0 0.29 1.0 ];
          };
        };
        overview-open-close = {
          kind.spring = {
            damping-ratio = 1.0;
            epsilon       = 0.0001;
            stiffness     = 800;
          };
        };
      };

      # ── Window rules ──────────────────────────────────────────────────────
      window-rules = [
        {
          matches           = [{ app-id = "^zen-twilight$"; }];
          open-on-workspace = "browser";
          open-maximized    = true;
        }
        {
          matches           = [{ app-id = "^vesktop$"; }];
          open-on-workspace = "DiSpot";
        }
        {
          matches           = [{ title = "^Spotify$"; }];
          open-on-workspace = "DiSpot";
        }
        {
          matches        = [{ app-id = "^steam$"; }];
          open-maximized = true;
        }
        {
          matches        = [{ app-id = "^REAPER$"; }];
          open-maximized = true;
        }
        {
          matches              = [{ app-id = "^org\\.wezfurlong\\.wezterm$"; }];
          default-column-width = {};
        }
        {
          matches       = [
            { title = "^Zen Browser$"; }
            { title = "^Picture-in-Picture$"; }
          ];
          open-floating = true;
        }
        # Clip + rounded corners для всех окон
        {
          matches          = [];
          clip-to-geometry = true;
          geometry-corner-radius = {
            top-left     = 4.0;
            top-right    = 4.0;
            bottom-left  = 4.0;
            bottom-right = 4.0;
          };
        }
      ];

      # ── Debug ─────────────────────────────────────────────────────────────
      debug.honor-xdg-activation-with-invalid-serial = true;

      # ── Keybinds ──────────────────────────────────────────────────────────
      binds = {
    # Workspace focus
        "Mod+1".action.focus-workspace = 1;
        "Mod+2".action.focus-workspace = 2;
        "Mod+3".action.focus-workspace = 3;
        "Mod+4".action.focus-workspace = 4;
        "Mod+5".action.focus-workspace = 5;
        "Mod+6".action.focus-workspace = 6;
        "Mod+7".action.focus-workspace = 7;
        "Mod+8".action.focus-workspace = 8;
        "Mod+9".action.focus-workspace = 9;
        "Mod+U".action.focus-workspace-down = {};
        "Mod+I".action.focus-workspace-up = {};
        "Mod+WheelScrollDown" = {
          action.focus-workspace-down = {};
          cooldown-ms = 150;
        };
        "Mod+WheelScrollUp" = {
          action.focus-workspace-up = {};
          cooldown-ms = 150;
        };

        # Move window/column to workspace
        "Mod+Ctrl+1".action.move-column-to-workspace = 1;
        "Mod+Ctrl+2".action.move-column-to-workspace = 2;
        "Mod+Ctrl+3".action.move-column-to-workspace = 3;
        "Mod+Ctrl+4".action.move-column-to-workspace = 4;
        "Mod+Ctrl+5".action.move-column-to-workspace = 5;
        "Mod+Ctrl+6".action.move-column-to-workspace = 6;
        "Mod+Ctrl+7".action.move-column-to-workspace = 7;
        "Mod+Ctrl+8".action.move-column-to-workspace = 8;
        "Mod+Ctrl+9".action.move-column-to-workspace = 9;
        "Mod+Ctrl+U".action.move-column-to-workspace-down = {};
        "Mod+Ctrl+I".action.move-column-to-workspace-up = {};
        "Mod+Ctrl+WheelScrollDown" = {
          action.move-column-to-workspace-down = {};
          cooldown-ms = 150;
        };
        "Mod+Ctrl+WheelScrollUp" = {
          action.move-column-to-workspace-up = {};
          cooldown-ms = 150;
        };

        # Focus window / column
        "Mod+J".action.focus-window-down = {};
        "Mod+K".action.focus-window-up = {};
        "Mod+L".action.focus-column-right = {};
        "Mod+Right".action.focus-column-right = {};
        "Mod+Left".action.focus-column-left = {};
        "Mod+WheelScrollLeft".action.focus-column-left = {};
        "Mod+WheelScrollRight".action.focus-column-right = {};

        # Move window / column
        "Mod+Ctrl+J".action.move-window-down = {};
        "Mod+Ctrl+K".action.move-window-up = {};
        "Mod+Ctrl+L".action.move-column-right = {};
        "Mod+Ctrl+Shift+WheelScrollDown".action.move-column-right = {};
        "Mod+Ctrl+Shift+WheelScrollUp".action.move-column-left = {};

        # Move column to monitor
        "Mod+Shift+Ctrl+H".action.move-column-to-monitor-left = {};
        "Mod+Shift+Ctrl+J".action.move-column-to-monitor-down = {};
        "Mod+Shift+Ctrl+K".action.move-column-to-monitor-up = {};
        "Mod+Shift+Ctrl+L".action.move-column-to-monitor-right = {};
        "Mod+Shift+Ctrl+Left".action.move-column-to-monitor-left = {};
        "Mod+Shift+Ctrl+Right".action.move-column-to-monitor-right = {};
        "Mod+Shift+Ctrl+Up".action.move-column-to-monitor-up = {};
        "Mod+Shift+Ctrl+Down".action.move-column-to-monitor-down = {};

        # Focus monitor
        "Mod+Shift+Left".action.focus-monitor-left = {};
        "Mod+Shift+Right".action.focus-monitor-right = {};
        "Mod+Shift+Up".action.focus-monitor-up = {};
        "Mod+Shift+Down".action.focus-monitor-down = {};
        "Mod+Shift+H".action.focus-monitor-left = {};
        "Mod+Shift+J".action.focus-monitor-down = {};
        "Mod+Shift+K".action.focus-monitor-up = {};
        "Mod+Shift+L".action.focus-monitor-right = {};

        # Resize
        "Mod+Equal".action.set-column-width = "+10%";
        "Mod+Minus".action.set-column-width = "-10%";
        "Mod+Shift+Equal".action.set-window-height = "+10%";
        "Mod+Shift+Minus".action.set-window-height = "-10%";

        # Layout actions
        "Mod+R".action.switch-preset-column-width = {};
        "Mod+Shift+R".action.switch-preset-window-height = {};
        "Mod+F".action.maximize-column = {};
        "Mod+Shift+F".action.fullscreen-window = {};
        "Mod+C".action.center-column = {};
        "Mod+Comma".action.consume-window-into-column = {};
        "Mod+Period".action.expel-window-from-column = {};

        # Window state
        "Mod+Q" = {
          action.close-window = {};
          repeat = false;
        };
        "Mod+V".action.toggle-window-floating = {};
        "Mod+Shift+V".action.switch-focus-between-floating-and-tiling = {};
        "Mod+W".action.toggle-column-tabbed-display = {};
        "Mod+O" = {
          action.toggle-overview = {};
          repeat = false;
        };

        # Wheel to move focus columns
        "Mod+Shift+WheelScrollDown".action.focus-column-right = {};
        "Mod+Shift+WheelScrollUp".action.focus-column-left = {};

        # Apps
        "Mod+Return" = {
          action.spawn = "kitty";
          hotkey-overlay.title = "Open a Terminal: kitty";
        };
        "Mod+D" = {
          action.spawn = [ "vicinae" "toggle" ];
          hotkey-overlay.title = "Run an Application: vicinae";
        };

        # System
        "Mod+Shift+E".action.quit = {};
        "Mod+Shift+P".action.power-off-monitors = {};
        "Mod+Shift+Slash".action.show-hotkey-overlay = {};
        "Print".action.screenshot = {};

        # Media keys
        "XF86AudioLowerVolume" = {
          action.spawn = [ "sh" "-c" "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-" ];
          allow-when-locked = true;
        };
        "XF86AudioRaiseVolume" = {
          action.spawn = [ "sh" "-c" "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+ -l 1.0" ];
          allow-when-locked = true;
        };
        "XF86AudioMute" = {
          action.spawn = [ "sh" "-c" "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle" ];
          allow-when-locked = true;
        };
        "XF86MonBrightnessUp" = {
          action.spawn = [ "brightnessctl" "--class=backlight" "set" "+10%" ];
          allow-when-locked = true;
        };
        "XF86MonBrightnessDown" = {
          action.spawn = [ "brightnessctl" "--class=backlight" "set" "10%-" ];
          allow-when-locked = true;
        };
      };
    };

   # config =
   #   ''
   #   blur {
   #       passes     2
   #       offset     2
   #       noise      0.05
   #       saturation 1.3
   #   }

   #   window-rule {
   #       match app-id="^kitty$"
   #       background-effect {
   #           blur true
   #       }
   #   }

   #   layer-rule {
   #       match namespace="^awww-daemonbackdrop$"
   #       place-within-backdrop true
   #   }
   #   '';
    };
}
