{ pkgs, config, ... }:
{
  systemd.user.sessionVariables = {
    XDG_DATA_DIRS = "${pkgs.gruvbox-plus-icons}/share:${pkgs.kdePackages.breeze-icons}/share:${pkgs.adwaita-icon-theme}/share:/etc/profiles/per-user/$USER/share:/run/current-system/sw/share";
  };

  gtk.enable = true;

  home.packages = with pkgs; [
     adwaita-icon-theme
     kdePackages.breeze-icons
  ];

  stylix.icons = {
    enable = true;
    package = pkgs.gruvbox-plus-icons;
    dark = "Gruvbox-Plus-Dark";
    light = "Gruvbox-Plus-Light";
  };

  stylix.targets.gtk.enable = true;
  stylix.targets.gtk.colors.enable = true;
  stylix.targets.mako.enable = true;
}
