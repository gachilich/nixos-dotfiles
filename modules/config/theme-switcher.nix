{ pkgs, lib, ... }:

let
  wallpaperLight = "/home/gachilich/nixos-dotfiles/nixpics/Wallpapers/artur.png";
  wallpaperDark  = "/home/gachilich/nixos-dotfiles/nixpics/Wallpapers/nix-gray.png";

  appsToRestart = [
    { pname = "kitty";   bin = "/etc/profiles/per-user/gachilich/bin/kitty"; }
    { pname = "spotify"; bin = "/etc/profiles/per-user/gachilich/bin/spotify"; }
    { pname = "zen-twilight"; bin = "/etc/profiles/per-user/gachilich/bin/zen-twilight"; }
  ];

  restartCmds = lib.concatMapStringsSep "\n" (app: ''
    if pgrep -x "${app.pname}" > /dev/null 2>&1; then
      echo "  перезапускаю ${app.pname}..."
      pkill -x "${app.pname}" || true
      sleep 0.8
      setsid -f "${app.bin}" > /dev/null 2>&1 &
    fi
  '') appsToRestart;

  switchTheme = pkgs.writeShellScriptBin "switch-theme" ''
    set -euo pipefail

    SYSTEM_BASE="/nix/var/nix/profiles/system"

    case "''${1:-}" in

      light)
        echo "→ Активирую светлую тему..."

        sudo "$SYSTEM_BASE/bin/switch-to-configuration" test

        echo "→ Устанавливаю светлые обои..."
        sleep 1
        awww img "${wallpaperLight}" --transition-type wipe --transition-duration 3
        awww img "${wallpaperLight}" --namespace backdrop --transition-type wipe --transition-duration 3

        echo "→ Перезапускаю приложения..."
        ${restartCmds}
        echo "✓ Светлая тема активирована"
        ;;

      dark)
        echo "→ Активирую тёмную тему..."

        DARK_STC="$SYSTEM_BASE/specialisation/dark/bin/switch-to-configuration"

        sudo "$DARK_STC" test

        echo "→ Устанавливаю тёмные обои..."
        sleep 1
        awww img "${wallpaperDark}" --transition-type wipe --transition-duration 3
        awww img "${wallpaperDark}" --namespace backdrop --transition-type wipe --transition-duration 3

        echo "→ Перезапускаю приложения..."
        ${restartCmds}
        echo "✓ Тёмная тема активирована"
        ;;

      *)
        echo "Использование: switch-theme <light|dark>" >&2
        exit 1
        ;;
    esac
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
