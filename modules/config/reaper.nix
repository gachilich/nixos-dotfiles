{ pkgs, lib, ... }:
let
  libxdoCompat = pkgs.runCommand "libxdo-compat" {} ''
    mkdir -p $out/lib
    ln -s ${pkgs.xdotool}/lib/libxdo.so.4 $out/lib/libxdo.so.3
  '';

  reaperLibs = lib.makeLibraryPath (with pkgs; [
    freetype
    libpng
    zlib
    fontconfig.lib
    libepoxy
    gtk3
    cairo
    glib.out
    libgcc.lib
    systemd
    udev
    xdotool
    libX11
    libxdoCompat
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
    tuxguitar
  ];
}
