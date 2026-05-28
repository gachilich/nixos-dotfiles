{ pkgs, inputs, ...}:
{
  programs.niri= {
    enable = true;
    package = inputs.niri.packages.${pkgs.stdenv.hostPlatform.system}.niri-unstable;
  };

  services.dbus.enable = true;
  #programs.xwayland.enable = true;
  services.tumbler.enable = true;
  programs.xfconf.enable = true;
  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    xwayland-satellite
    libsForQt5.qt5ct
    mesa-demos
  ];

  services.xserver.excludePackages = [ pkgs.xterm ];

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  xdg.portal = {
  enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gnome
      pkgs.xdg-desktop-portal-gtk
    ];
    config = {
      niri.default = [ "gnome" "gtk" ];
    };
  };
}
