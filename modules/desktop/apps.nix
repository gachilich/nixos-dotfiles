{ pkgs, ... }:
{
  services.gvfs.enable = true;

  environment.systemPackages = with pkgs; [
    wl-clipboard
    timg
    winetricks
    qimgv
    awww
    mpv
    strawberry
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
