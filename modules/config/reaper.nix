{ pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    reaper
    yabridge
    yabridgectl
    pkgs.vital
    wineWow64Packages.yabridge
  ];
  programs.nix-ld.libraries = with pkgs; [
    freetype
    libpng
    zlib
    fontconfig.lib
    libepoxy
    gtk3
    cairo
    glib.out
    stdenv.cc.cc.lib
    systemd
    xdotool
    libX11
  ];
}
