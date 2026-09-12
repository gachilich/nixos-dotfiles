{ pkgs, lib, ... }:
{
  stylix = {
    enable = true;
    polarity = "light";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-material-light-soft.yaml";
    targets.grub.enable = false;
    opacity = {
      applications = 0.85;
      terminal     = 0.70;
      desktop      = 1.0;
      popups       = 0.9;
    };
  };
  stylix.cursor = {
    name = "BreezeX-RosePine-Linux";
    package = pkgs.rose-pine-cursor;
    size = 32;
  };

  stylix.targets.kmscon.enable = false;
  stylix.fonts = {
    serif = {
      package = pkgs.maple-mono.NF;
      name = "Maple Mono NF SemiBold";
    };
    sansSerif = {
      package = pkgs.maple-mono.NF;
      name = "Maple Mono NF SemiBold";
    };
    monospace = {
      package = pkgs.maple-mono.NF;
      name = "Maple Mono NF SemiBold";
    };
    emoji = {
      package = pkgs.noto-fonts-color-emoji;
      name = "Noto Color Emoji";
    };
  };

  specialisation.dark.configuration = {
    stylix = {
      polarity = pkgs.lib.mkForce "dark";
      base16Scheme = pkgs.lib.mkForce "${pkgs.base16-schemes}/share/themes/gruvbox-material-dark-hard.yaml";
    };
  };
}
