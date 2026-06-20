{ pkgs, ... }:
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
    superfile
    thunar
    rose-pine-cursor
    zoxide
    obsidian
    mako
    kdePackages.ark
    unrar
    gparted
    qbittorrent-enhanced
    telegram-desktop
    btop
  ];
}
