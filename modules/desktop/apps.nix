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
    thunar
    rose-pine-cursor
    obsidian
    mako
    kdePackages.ark
    unrar
    gparted
    qbittorrent-enhanced
    telegram-desktop
    btop
  ];
  programs.localsend = {
    enable = true;
    openFirewall = true;
  };
  services.lact.enable = true;
}
