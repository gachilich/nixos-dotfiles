{ lib, ... }:
{
  programs.btop = lib.mkForce {
      enable = true;
        settings = {
          color_theme = "stylix";
          theme_background = false;
        };
    };
}
