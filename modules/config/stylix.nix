{ pkgs, lib, ... }:{

  stylix = {
    enable = true;
    polarity = "light";
    image = ../../nixpics/Wallpapers/wallhaven_1qdk61.jpg;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-light-soft.yaml";
    targets.grub.enable = false;
  };

  stylix.override = {
    base05 = "3c3836";
    base04 = "504945";
    base03 = "665c54";
  };

  stylix.cursor = {
    name = "BreezeX-RosePine-Linux";
    package = pkgs.rose-pine-cursor;
    size = 32;
  };

  stylix.fonts = {
     sansSerif = {
       package = pkgs.maple-mono.NF;
       name = "MapleMono-NF";
     };

     monospace = {
       package = pkgs.maple-mono.NF;
       name = "MapleMono-NF";
     };

     emoji = {
       package = pkgs.noto-fonts-color-emoji;
       name = "Noto Color Emoji";
     };
    };

  specialisation.dark.configuration = {
  stylix = {
    polarity = pkgs.lib.mkForce "dark";
    image = lib.mkForce ../../nixpics/Wallpapers/wallhaven-85eqe2.png;
    base16Scheme = pkgs.lib.mkForce "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-hard.yaml";
    };
  };
}
