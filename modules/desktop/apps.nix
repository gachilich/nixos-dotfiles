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
    inputs.linux-wallpaper-engine.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];

  programs.localsend = {
    enable = true;
    openFirewall = true;
  };
  services.lact.enable = true;
}
