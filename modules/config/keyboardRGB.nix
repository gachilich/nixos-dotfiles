{ pkgs, ... }:
{
  hardware.tuxedo-drivers.enable = true;

  systemd.services.keyboard-rgb = {
   description = "Keyboard RGB";
   wantedBy = [ "multi-user.target" ];
   serviceConfig = {
     Type = "oneshot";
     ExecStart = pkgs.writeShellScript "keyboard-rgb" ''
       echo "233 61 88" > /sys/devices/platform/tuxedo_keyboard/leds/rgb:kbd_backlight/multi_intensity
       echo "255" > /sys/devices/platform/tuxedo_keyboard/leds/rgb:kbd_backlight/brightness
     '';
        };
   };
}
