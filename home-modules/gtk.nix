{ pkgs, lib, config, ... }:{

  gtk = {
    enable = true;
    iconTheme = {
      name = lib.mkForce "Colloid-Dark";
      package = lib.mkForce pkgs.colloid-icon-theme;
    };
    cursorTheme = {
      name = "BreezeX-RosePine-Linux";
      package = pkgs.rose-pine-cursor;
    };
  };
  gtk.gtk4.theme = config.gtk.theme;
  stylix.targets.gtk.colors.enable = true;
  stylix.targets.gtk.enable = true;
  home.pointerCursor = {
    name = "BreezeX-RosePine-Linux";
    package = pkgs.rose-pine-cursor;
    size = 32;
    gtk.enable = true; # Ensures GTK apps pick up the theme
};
}
