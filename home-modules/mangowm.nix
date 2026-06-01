{ inputs, pkgs, ... }:
{
  imports = [
    inputs.mangowm.hmModules.mango
  ];

  wayland.windowManager.mango = {
    enable = true;
    settings = {

      monitorrule = [
        "name:^eDP-1$,width:1920,height:1080,refresh:144,x:1920,y:0,scale:1,vrr:1"
        "name:^HDMI-A-1$,width:1920,height:1080,refresh:60,x:0,y:0,scale:1,vrr:0"
      ];
      allow_tearing = 0;

      repeat_rate = 25;
      repeat_delay = 600;
      numlockon = 1;
      xkb_rules_layout = "us,ru";
      xkb_rules_options = "grp:win_space_toggle,compose:ralt,ctrl:nocaps";

      disable_trackpad = 0;
      tap_to_click = 1;
      tap_and_drag = 1;
      drag_lock = 1;
      drag_corner = 4;

      trackpad_natural_scrolling = 1;
      disable_while_typing = 1;
      left_handed = 0;
      middle_button_emulation = 0;
      swipe_min_threshold = 1;

      mouse_natural_scrolling = 0;

      blur = 1;
      blur_layer = 0;
      blur_optimized = 1;
      blur_params_num_passes = 2;
      blur_params_radius = 2;
      blur_params_noise = 0.08;
      blur_params_brightness = 1;
      blur_params_contrast = 1;
      blur_params_saturation = 1;

      shadows = 1;
      layer_shadows = 1;
      shadow_only_floating = 0;
      shadows_size = 5;
      shadows_blur = 30;
      shadows_position_x = 0;
      shadows_position_y = 5;
      shadowscolor = "0x00000070";

      border_radius = 3;
      no_radius_when_single = 0;
      focused_opacity = 1;
      unfocused_opacity = 1;

      animations = 1;
      layer_animations = 1;
      animation_type_open = "slide";
      animation_type_close = "slide";
      animation_fade_in = 1;
      animation_fade_out = 1;
      tag_animation_direction = 0;
      zoom_initial_ratio = 0.4;
      zoom_end_ratio = 0.8;
      fadein_begin_opacity = 0.5;
      fadeout_begin_opacity = 0.8;
      animation_duration_move = 750;
      animation_duration_open = 650;
      animation_duration_tag = 550;
      animation_duration_close = 550;
      animation_duration_focus = 0;
      animation_curve_open = "0.16,1,0.3,1";
      animation_curve_move = "0.46,1.0,0.29,1";
      animation_curve_tag = "0.46,1.0,0.29,1";
      animation_curve_close = "0.08,0.92,0,1";
      animation_curve_focus = "0.46,1.0,0.29,1";
      animation_curve_opafadeout = "0.5,0.5,0.5,0.5";
      animation_curve_opafadein = "0.46,1.0,0.29,1";

      scroller_structs = 20;
      scroller_default_proportion = 0.5;
      scroller_focus_center = 0;
      scroller_prefer_center = 0;
      edge_scroller_pointer_focus = 1;
      scroller_default_proportion_single = 1.0;
      scroller_proportion_preset = "0.333,0.5,0.667";

      new_is_master = 1;
      default_mfact = 0.55;
      default_nmaster = 1;
      smartgaps = 0;

      dwindle_smart_split = 0;
      dwindle_drop_simple_split = 1;
      dwindle_manual_split = 0;
      dwindle_hsplit = 1;
      dwindle_vsplit = 1;
      dwindle_preserve_split = 0;

      hotarea_size = 10;
      enable_hotarea = 0;
      ov_tab_mode = 1;
      ov_no_resize = 1;
      overviewgappi = 5;
      overviewgappo = 30;

      no_border_when_single = 0;
      axis_bind_apply_timeout = 100;
      focus_on_activate = 1;
      idleinhibit_ignore_visible = 0;
      sloppyfocus = 1;
      warpcursor = 1;
      focus_cross_monitor = 0;
      focus_cross_tag = 0;
      enable_floating_snap = 0;
      snap_distance = 30;
      drag_tile_to_tile = 1;
      drag_tile_small = 1;

      gappih = 10;
      gappiv = 10;
      gappoh = 10;
      gappov = 10;
      scratchpad_width_ratio = 0.8;
      scratchpad_height_ratio = 0.9;
      borderpx = 2;

      rootcolor = "0x201b14ff";
      bordercolor = "0xa89984ff";
      dropcolor = "0x8FBA7C55";
      splitcolor = "0xEB441EFF";
      focuscolor = "0x45707aff";
      maximizescreencolor = "0x89aa61ff";
      urgentcolor = "0xad401fff";
      scratchpadcolor = "0x516c93ff";
      globalcolor = "0xb153a7ff";
      overlaycolor = "0x14a57cff";

      circle_layout = "tile,scroller,grid,dwindle";

      tagrule = [
        "id:1,layout_name:tile"
        "id:2,layout_name:scroller"
        "id:3,layout_name:tile"
        "id:4,layout_name:tile"
        "id:5,layout_name:tile"
        "id:6,layout_name:tile"
        "id:7,layout_name:tile"
        "id:8,layout_name:tile"
        "id:9,layout_name:tile"
      ];

      windowrule = [
        "tags:2,monitor:eDP-1,appid:zen-twilight"
        "tags:1,monitor:eDP-1,appid:vesktop"
        "tags:1,monitor:eDP-1,title:Spotify"
        "focused_opacity:0.95,unfocused_opacity:0.95,appid:thunar"
        "focused_opacity:0.8,unfocused_opacity:0.8,appid:kitty"
      ];

      bind = [

        "SUPER,r,reload_config"
        "SUPER+SHIFT,E,quit"
        "CTRL+ALT,Delete,quit"
        "SUPER,Q,killclient"

        "SUPER,Return,spawn,kitty"
        "SUPER,D,spawn_shell,vicinae toggle"
        "SUPER,s,spawn_shell,dms settings"

        "SUPER,F,togglemaximizescreen"
        "SUPER+SHIFT,F,togglefullscreen"
        "SUPER,V,togglefloating"
        "SUPER,O,toggleoverview"
        "SUPER,C,centerwin"
        "SUPER,W,switch_layout"
        "SUPER,g,toggleglobal"
        "SUPER+SHIFT,I,restore_minimized"
        "ALT,z,toggle_scratchpad"

        "SUPER,BracketLeft,scroller_stack,left"
        "SUPER,BracketRight,scroller_stack,right"
        "SUPER,comma,scroller_stack,up"
        "SUPER,period,scroller_stack,down"
        "SUPER+CTRL,F,set_proportion,1.0"
        "SUPER,R,switch_proportion_preset"
        "ALT,x,switch_proportion_preset"
        "ALT,e,set_proportion,1.0"

        "SUPER,equal,resizewin,+100,0"
        "SUPER,minus,resizewin,-100,0"
        "SUPER+SHIFT,equal,resizewin,0,+100"
        "SUPER+SHIFT,minus,resizewin,0,-100"
        "CTRL+ALT,Up,resizewin,+0,-50"
        "CTRL+ALT,Down,resizewin,+0,+50"
        "CTRL+ALT,Left,resizewin,-50,+0"
        "CTRL+ALT,Right,resizewin,+50,+0"

        "SUPER,H,focusdir,left"
        "SUPER,J,focusdir,down"
        "SUPER,K,focusdir,up"
        "SUPER,L,focusdir,right"
        "SUPER,Left,focusdir,left"
        "SUPER,Down,focusdir,down"
        "SUPER,Up,focusdir,up"
        "SUPER,Right,focusdir,right"

        "SUPER+CTRL,H,exchange_client,left"
        "SUPER+CTRL,J,exchange_client,down"
        "SUPER+CTRL,K,exchange_client,up"
        "SUPER+CTRL,L,exchange_client,right"
        "SUPER+CTRL,Left,exchange_client,left"
        "SUPER+CTRL,Down,exchange_client,down"
        "SUPER+CTRL,Up,exchange_client,up"
        "SUPER+CTRL,Right,exchange_client,right"

        "SUPER+SHIFT,H,focusmon,left"
        "SUPER+SHIFT,J,focusmon,down"
        "SUPER+SHIFT,K,focusmon,up"
        "SUPER+SHIFT,L,focusmon,right"
        "SUPER+SHIFT,Left,focusmon,left"
        "SUPER+SHIFT,Down,focusmon,down"
        "SUPER+SHIFT,Up,focusmon,up"
        "SUPER+SHIFT,Right,focusmon,right"

        "SUPER+SHIFT+CTRL,H,tagmon,left"
        "SUPER+SHIFT+CTRL,J,tagmon,down"
        "SUPER+SHIFT+CTRL,K,tagmon,up"
        "SUPER+SHIFT+CTRL,L,tagmon,right"
        "SUPER+SHIFT+CTRL,Left,tagmon,left"
        "SUPER+SHIFT+CTRL,Down,tagmon,down"
        "SUPER+SHIFT+CTRL,Up,tagmon,up"
        "SUPER+SHIFT+CTRL,Right,tagmon,right"

        "SUPER,U,viewtoleft,0"
        "SUPER,I,viewtoright,0"
        "SUPER+CTRL,U,tagtoleft,0"
        "SUPER+CTRL,I,tagtoright,0"
        "SUPER,Page_Up,viewtoleft,0"
        "SUPER,Page_Down,viewtoright,0"
        "SUPER+CTRL,Page_Up,tagtoleft,0"
        "SUPER+CTRL,Page_Down,tagtoright,0"

        "SUPER,1,view,1,0"
        "SUPER,2,view,2,0"
        "SUPER,3,view,3,0"
        "SUPER,4,view,4,0"
        "SUPER,5,view,5,0"
        "SUPER,6,view,6,0"
        "SUPER,7,view,7,0"
        "SUPER,8,view,8,0"
        "SUPER,9,view,9,0"

        "SUPER+CTRL,1,tag,1,0"
        "SUPER+CTRL,2,tag,2,0"
        "SUPER+CTRL,3,tag,3,0"
        "SUPER+CTRL,4,tag,4,0"
        "SUPER+CTRL,5,tag,5,0"
        "SUPER+CTRL,6,tag,6,0"
        "SUPER+CTRL,7,tag,7,0"
        "SUPER+CTRL,8,tag,8,0"
        "SUPER+CTRL,9,tag,9,0"

        "SUPER,n,switch_layout"

        "ALT+SHIFT,X,incgaps,1"
        "ALT+SHIFT,Z,incgaps,-1"

        "SUPER+SHIFT,P,spawn_shell,wlr-dpms off"

        "SHIFT,Print,spawn,$HOME/.config/mango/scripts/screenshot/screenshot.sh region"
        "SUPER,Print,spawn,$HOME/.config/mango/scripts/screenshot/screenshot.sh annotate"
      ];

      bindl = [
        "SUPER+ALT,S,spawn_shell,pkill orca || exec orca"

        "NONE,XF86AudioRaiseVolume,spawn_shell,wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1+ -l 1.0"
        "NONE,XF86AudioLowerVolume,spawn_shell,wpctl set-volume @DEFAULT_AUDIO_SINK@ 0.1-"
        "NONE,XF86AudioMute,spawn_shell,wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        "NONE,XF86AudioMicMute,spawn_shell,wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
        "NONE,XF86AudioPlay,spawn_shell,playerctl play-pause"
        "NONE,XF86AudioNext,spawn_shell,playerctl next"
        "NONE,XF86AudioPrev,spawn_shell,playerctl previous"
        "NONE,XF86AudioStop,spawn_shell,playerctl stop"

        "NONE,XF86MonBrightnessUp,spawn_shell,brightnessctl --class=backlight set +10%"
        "NONE,XF86MonBrightnessDown,spawn_shell,brightnessctl --class=backlight set 10%"
      ];

      mousebind = [
        "SUPER,btn_left,moveresize,curmove"
        "SUPER,btn_right,moveresize,curresize"
      ];

      axisbind = [
        "SUPER,UP,viewtoleft_have_client"
        "SUPER,DOWN,viewtoright_have_client"
        "SUPER+CTRL,UP,tagtoleft"
        "SUPER+CTRL,DOWN,tagtoright"
      ];
    };

    autostart_sh = ''
      zen-twilight &
      spotify &
      vesktop &
      /etc/profiles/per-user/gachilich/bin/vicinae server &
      awww-daemon &
      noctalia-shell &
    '';
  };

  home.file.".config/mango/scripts/screenshot/screenshot.sh" = {
    executable = true;
    text = ''
      #!/usr/bin/env bash
      set -euo pipefail

      mkdir -p "$HOME/Pictures/Screenshots"
      filepath="$HOME/Pictures/Screenshots/$(date +%Y%m%d%H%M%S).png"

      case "''${1:-region}" in
      region)
        g=$(slurp -d); [ -z "$g" ] && exit 1
        grim -g "$g" - | wl-copy -t image/png ;;
      annotate)
        g=$(slurp -d); [ -z "$g" ] && exit 1
        grim -g "$g" "$filepath"
        satty --filename "$filepath" --output-filename "$filepath" \
          --actions-on-enter save-to-file --early-exit
        wl-copy -t image/png < "$filepath" ;;
      esac
    '';
  };

  home.packages = with pkgs; [
    grim
    slurp
    wl-clipboard
    satty
  ];
}
