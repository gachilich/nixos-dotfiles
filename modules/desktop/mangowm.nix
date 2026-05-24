{ pkgs, lib, ... }:{

  services.dbus.enable = true;
  services.tumbler.enable = true;
  programs.xwayland.enable = true;
  programs.xfconf.enable = true;
  programs.dconf.enable = true;

  programs.mango.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-wlr
      pkgs.xdg-desktop-portal-gtk
    ];
    config = {
      mango = {  # <-- вместо common; точное значение XDG_CURRENT_DESKTOP
        default = lib.mkForce [ "wlr" "gtk" ];
        "org.freedesktop.impl.portal.ScreenCast" = [ "wlr" ];
        "org.freedesktop.impl.portal.Screenshot" = [ "wlr" ];
      };
    };
  };
}
