{ pkgs, lib, config, ... }:
{
  gtk = {
    enable = true;
    iconTheme = {
      name = lib.mkForce "Colloid-Dark";
      package = lib.mkForce pkgs.colloid-icon-theme;
    };
  };

  gtk.gtk4.theme = config.gtk.theme;
  stylix.targets.gtk.colors.enable = true;
  stylix.targets.gtk.enable = true;
}
