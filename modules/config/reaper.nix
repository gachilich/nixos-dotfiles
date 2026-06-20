{ pkgs, lib, ... }:
let
  reaperLibs = lib.makeLibraryPath (with pkgs; [
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
  ]);

  reaper-wrapped = pkgs.symlinkJoin {
    name = "reaper-wrapped";
    paths = [ pkgs.reaper ];
    nativeBuildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      wrapProgram $out/bin/reaper \
        --prefix LD_LIBRARY_PATH : "${reaperLibs}"
    '';
  };
in
{
  environment.systemPackages = with pkgs; [
    reaper-wrapped
    yabridge
    yabridgectl
    vital
    wineWow64Packages.yabridge
  ];
}
