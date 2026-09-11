{ pkgs, inputs, ... }:
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
  ];

  programs.localsend = {
    enable = true;
    openFirewall = true;
  };
  # services.lact.enable = true;
}
