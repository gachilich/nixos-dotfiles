{ pkgs, ... }:

let
  wallpaperLight = "/home/gachilich/nixos-dotfiles/nixpics/wallpapers/artur.png";
  wallpaperLightBlur = "/home/gachilich/nixos-dotfiles/nixpics/wallpapers/blur/berseks_blur.png";
  wallpaperDark  = "/home/gachilich/nixos-dotfiles/nixpics/wallpapers/tux.png";
  wallpaperDarkBlur  = "/home/gachilich/nixos-dotfiles/nixpics/wallpapers/blur/gruvcity_blur.png";

  switchTheme = pkgs.writeShellScriptBin "switch-theme" ''
    set -euo pipefail

    SYSTEM_BASE="/nix/var/nix/profiles/system"

    case "''${1:-}" in
      light)
        theme="светлую"
        switch_to="$SYSTEM_BASE/bin/switch-to-configuration"
        wallpaper="${wallpaperLight}"
        wallpaper_blur="${wallpaperLightBlur}"
        ;;
      dark)
        theme="тёмную"
        switch_to="$SYSTEM_BASE/specialisation/dark/bin/switch-to-configuration"
        wallpaper="${wallpaperDark}"
        wallpaper_blur="${wallpaperDarkBlur}"
        ;;
      *)
        echo "Использование: switch-theme <light|dark>" >&2
        exit 1
        ;;
    esac

    echo "→ Активирую ''${theme} тему..."
    sudo "$switch_to" test

    echo "→ Устанавливаю ''${theme} обои..."
    sleep 1
    awww img "$wallpaper" --transition-type wipe --transition-duration 3
    awww img "$wallpaper_blur" --namespace backdrop --transition-type wipe --transition-duration 3

    echo "✓ ''${theme^} тема активирована"
  '';

in
{
  environment.systemPackages = [ switchTheme ];

  security.sudo.extraRules = [
    {
      users = [ "gachilich" ];
      commands = [
        {
          command = "/nix/var/nix/profiles/system/bin/switch-to-configuration";
          options = [ "NOPASSWD" ];
        }
        {
          command = "/nix/var/nix/profiles/system/specialisation/dark/bin/switch-to-configuration";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];
}
