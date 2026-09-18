{ config, ... }:
{
  home.file.".local/bin/move-torrents.sh" = {
    source = ../scripts/move-torrents.sh;
    executable = true;
  };

programs.niri = {
    config = ''
      input {
          keyboard {
              xkb {
                  layout "us,ru"
                  options "grp:win_space_toggle,compose:ralt,ctrl:nocaps"
              }
              repeat-delay 600
              repeat-rate 25
              track-layout "global"
              numlock
          }
          touchpad {
              tap
              natural-scroll
          }
          focus-follows-mouse max-scroll-amount="25%"
      }

      output "HDMI-A-1" {
          scale 1.000000
          transform "normal"
          position x=-1920 y=0
          mode "1920x1080@60.000000"
      }

      output "eDP-1" {
          scale 1.000000
          transform "normal"
          position x=0 y=0
          mode "1920x1080@144.003000"
      }

      screenshot-path "~/Pictures/Screenshots/Screenshot from %Y-%m-%d %H-%M-%S.png"

      prefer-no-csd

      layout {
          gaps 10
          struts {
              left 0
              right 0
              top 0
              bottom 0
          }
          focus-ring { off; }
          border {
              width 2
              active-color "#45707a"
              inactive-color "#a89984"
          }
          shadow {
              on
              offset x=0 y=5
              softness 30
              spread 5
              draw-behind-window false
              color "#00000070"
          }
          default-column-width { proportion 0.500000; }
          preset-column-widths {
              proportion 0.333330
              proportion 0.500000
              proportion 0.666670
          }
          center-focused-column "never"
      }

      blur {
          passes 3
          offset 4
          noise 0.05
          saturation 1.4
      }

      cursor {
          xcursor-theme "BreezeX-RosePine-Linux"
          xcursor-size 32
      }

      binds {
          Mod+1 { focus-workspace 1; }
          Mod+2 { focus-workspace 2; }
          Mod+3 { focus-workspace 3; }
          Mod+4 { focus-workspace 4; }
          Mod+5 { focus-workspace 5; }
          Mod+6 { focus-workspace 6; }
          Mod+7 { focus-workspace 7; }
          Mod+8 { focus-workspace 8; }
          Mod+9 { focus-workspace 9; }
          Mod+U { focus-workspace-down; }
          Mod+I { focus-workspace-up; }
          Mod+WheelScrollDown cooldown-ms=150 { focus-workspace-down; }
          Mod+WheelScrollUp   cooldown-ms=150 { focus-workspace-up; }

          Mod+Ctrl+1 { move-column-to-workspace 1; }
          Mod+Ctrl+2 { move-column-to-workspace 2; }
          Mod+Ctrl+3 { move-column-to-workspace 3; }
          Mod+Ctrl+4 { move-column-to-workspace 4; }
          Mod+Ctrl+5 { move-column-to-workspace 5; }
          Mod+Ctrl+6 { move-column-to-workspace 6; }
          Mod+Ctrl+7 { move-column-to-workspace 7; }
          Mod+Ctrl+8 { move-column-to-workspace 8; }
          Mod+Ctrl+9 { move-column-to-workspace 9; }
          Mod+Ctrl+U { move-column-to-workspace-down; }
          Mod+Ctrl+I { move-column-to-workspace-up; }
          Mod+Ctrl+WheelScrollDown cooldown-ms=150 { move-column-to-workspace-down; }
          Mod+Ctrl+WheelScrollUp   cooldown-ms=150 { move-column-to-workspace-up; }

          Mod+J { focus-window-down; }
          Mod+K { focus-window-up; }
          Mod+L { focus-column-right; }
          Mod+Right { focus-column-right; }
          Mod+Left { focus-column-left; }
          Mod+WheelScrollLeft { focus-column-left; }
          Mod+WheelScrollRight { focus-column-right; }

          Mod+Ctrl+Left  { move-column-left; }
          Mod+Ctrl+Down  { move-window-down; }
          Mod+Ctrl+Up    { move-window-up; }
          Mod+Ctrl+Right { move-column-right; }
          Mod+Ctrl+H { move-column-left; }
          Mod+Ctrl+J { move-window-down; }
          Mod+Ctrl+K { move-window-up; }
          Mod+Ctrl+L { move-column-right; }

          Mod+Shift+Ctrl+H     { move-column-to-monitor-left; }
          Mod+Shift+Ctrl+J     { move-column-to-monitor-down; }
          Mod+Shift+Ctrl+K     { move-column-to-monitor-up; }
          Mod+Shift+Ctrl+L     { move-column-to-monitor-right; }
          Mod+Shift+Ctrl+Left  { move-column-to-monitor-left; }
          Mod+Shift+Ctrl+Right { move-column-to-monitor-right; }
          Mod+Shift+Ctrl+Up    { move-column-to-monitor-up; }
          Mod+Shift+Ctrl+Down  { move-column-to-monitor-down; }

          Mod+Shift+Left  { focus-monitor-left; }
          Mod+Shift+Right { focus-monitor-right; }
          Mod+Shift+Up    { focus-monitor-up; }
          Mod+Shift+Down  { focus-monitor-down; }
          Mod+Shift+H     { focus-monitor-left; }
          Mod+Shift+J     { focus-monitor-down; }
          Mod+Shift+K     { focus-monitor-up; }
          Mod+Shift+L     { focus-monitor-right; }

          Mod+Equal        { set-column-width "+10%"; }
          Mod+Minus        { set-column-width "-10%"; }
          Mod+Shift+Equal  { set-window-height "+10%"; }
          Mod+Shift+Minus  { set-window-height "-10%"; }
          Mod+R            { switch-preset-column-width; }
          Mod+Shift+R      { switch-preset-window-height; }
          Mod+F            { maximize-column; }
          Mod+Shift+F      { fullscreen-window; }
          Mod+C            { center-column; }

          Mod+Comma  { consume-window-into-column; }
          Mod+Period { expel-window-from-column; }
          Mod+Q      repeat=false { close-window; }
          Mod+V      { toggle-window-floating; }
          Mod+Shift+V { switch-focus-between-floating-and-tiling; }
          Mod+W      { toggle-column-tabbed-display; }
          Mod+O      repeat=false { toggle-overview; }

          Mod+Shift+WheelScrollDown { focus-column-right; }
          Mod+Shift+WheelScrollUp   { focus-column-left; }

          Mod+Return hotkey-overlay-title="Open a Terminal: kitty" { spawn "kitty"; }
          Mod+D      hotkey-overlay-title="Run an Application: vicinae" { spawn "vicinae" "toggle"; }

          Mod+Shift+E     { quit; }
          Mod+Shift+P     { power-off-monitors; }
          Mod+Shift+Slash { show-hotkey-overlay; }

          Print { screenshot; }

          XF86AudioLowerVolume allow-when-locked=true { spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-"; }
          XF86AudioRaiseVolume allow-when-locked=true { spawn-sh "wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+ -l 1.0"; }
          XF86AudioMute allow-when-locked=true { spawn-sh "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"; }
          XF86MonBrightnessUp allow-when-locked=true { spawn "brightnessctl" "--class=backlight" "set" "+10%"; }
          XF86MonBrightnessDown allow-when-locked=true { spawn "brightnessctl" "--class=backlight" "set" "10%-"; }
      }

      workspace "DiSpot"
      workspace "browser"

      spawn-at-startup "noctalia"
      spawn-at-startup "zen-twilight"
      spawn-at-startup "spotify"
      spawn-at-startup "vesktop"
      spawn-at-startup "awww-daemon"
      spawn-at-startup "awww-daemon" "--namespace" "backdrop"
      spawn-at-startup "${config.home.homeDirectory}/.local/bin/move-torrents.sh" "--watch" "${config.home.homeDirectory}/Downloads"

      window-rule {
          match app-id="zen-twilight"
          open-on-workspace "browser"
          open-maximized true
      }
      window-rule {
          match app-id="vesktop"
          open-on-workspace "DiSpot"
      }
      window-rule {
          match title="Spotify"
          open-on-workspace "DiSpot"
      }
      window-rule {
          match app-id="steam"
          open-maximized true
      }
      window-rule {
          match app-id="REAPER"
          open-maximized true
      }
      window-rule {
          match app-id="^org\\.wezfurlong\\.wezterm$"
          default-column-width
      }
      window-rule {
          match title="Zen Browser"
          match title="^Picture-in-Picture$"
          open-floating true
      }
      window-rule {
          match app-id="^kitty$"
          background-effect {
              blur true
              xray true
          }
      }

      window-rule { clip-to-geometry true; }
      window-rule { geometry-corner-radius 4.000000 4.000000 4.000000 4.000000; }

      layer-rule {
        match namespace="^awww-daemonbackdrop$"
        place-within-backdrop true
      }

      animations {
          window-open {
              duration-ms 650
              curve "cubic-bezier" 0.16 1.0 0.3 1.0
          }
          window-close {
              duration-ms 550
              curve "cubic-bezier" 0.08 0.92 0.0 1.0
          }
          window-movement {
              duration-ms 750
              curve "cubic-bezier" 0.46 1.0 0.29 1.0
          }
          window-resize { spring damping-ratio=1.0 epsilon=0.0001 stiffness=800; }
          workspace-switch {
              duration-ms 550
              curve "cubic-bezier" 0.46 1.0 0.29 1.0
          }
          overview-open-close { spring damping-ratio=1.0 epsilon=0.0001 stiffness=800; }
      }

      debug { honor-xdg-activation-with-invalid-serial true; }
    '';
  };
}
