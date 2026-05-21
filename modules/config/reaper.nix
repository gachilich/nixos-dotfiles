{ pkgs, lib, ... }:
{
  environment.systemPackages = with pkgs; [
    reaper
    yabridge
    yabridgectl
    pkgs.vital
    wineWow64Packages.yabridge
  ];
  environment.sessionVariables.LD_LIBRARY_PATH = [
    "${pkgs.freetype}/lib"
    "${pkgs.libpng}/lib"
    "${pkgs.zlib}/lib"
    "${pkgs.fontconfig.lib}/lib"
    "${pkgs.libepoxy}/lib"
    "${pkgs.gtk3}/lib"
    "${pkgs.cairo}/lib"
    "${pkgs.glib.out}/lib"
    "${pkgs.stdenv.cc.cc.lib}/lib"
    "${pkgs.systemd}/lib"        # исправлено
    "${pkgs.xdotool}/lib"
    "${pkgs.libX11}/lib"
  ];
}
