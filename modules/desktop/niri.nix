{ config, pkgs, lib, ... }:
{

  programs.niri.enable = true;

  environment.systemPackages = with pkgs; [
    xwayland-satellite
    xwayland
  ];

  xdg.portal = {
    enable = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-gnome
    ];

    config = {
      common = {
        default = [ "gtk" ];
      };
      niri = {
        default = lib.mkDefault [ "gtk" "gnome" ];
        "org.freedesktop.impl.portal.ScreenCast"   = [ "gnome" ];
        "org.freedesktop.impl.portal.Screenshot"   = [ "gnome" ];
      };
    };
  };
}
