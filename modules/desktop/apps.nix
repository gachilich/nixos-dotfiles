{ pkgs, inputs, ... }:
let
  oldPkgs = import (builtins.fetchTarball {
    url = "https://github.com/NixOS/nixpkgs/archive/c5dd43934613ae0f8ff37c59f61c507c2e8f980d.tar.gz";
    sha256 = "1cpw3m45v7s7bm9mi750dkdyjgd2gp2vq0y7vr3j42ifw1i85gxv";
  }) {
    inherit (pkgs.stdenv.hostPlatform) system;
    config.allowUnfree = true;
  };
in
{
  services.gvfs.enable = true;

  environment.systemPackages = with pkgs; [
    wl-clipboard
    winetricks
    qimgv
    awww
    mpv
    mpvpaper
    libsForQt5.qt5ct
    thunar
    xfconf
    rose-pine-cursor
    obsidian
    kdePackages.ark
    unrar
    gparted
    qbittorrent-enhanced
    telegram-desktop
    btop
    mpc
    strawberry
    kid3
    spotiflac
    aria2
    yt-dlp
    inputs.helium.packages.${stdenv.hostPlatform.system}.default
    codex
    vesta-viewer
    oldPkgs.vscode
  ];

  programs.localsend = {
    enable = true;
    openFirewall = true;
  };
  # services.lact.enable = true;
}
