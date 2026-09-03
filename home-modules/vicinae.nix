{ pkgs, inputs, lib, ... }:
{
  imports = [
    inputs.vicinae.homeManagerModules.default
  ];

  xdg.dataFile."icons/Gruvbox-Plus-Dark/index.theme".text =
    builtins.replaceStrings
    [ "Name=Gruvbox Plus Dark" "Inherits=breeze-dark, hicolor" ]
    [ "Name=Gruvbox-Plus-Dark" "Inherits=Papirus-Dark,hicolor" ]
    (builtins.readFile "${pkgs.gruvbox-plus-icons}/share/icons/Gruvbox-Plus-Dark/index.theme");

  xdg.dataFile."icons/Gruvbox-Plus-Light/index.theme".text =
    builtins.replaceStrings
    [ "Name=Gruvbox Plus Light" "Inherits=breeze-dark, hicolor" ]
    [ "Name=Gruvbox-Plus-Light" "Inherits=Papirus,hicolor" ]
    (builtins.readFile "${pkgs.gruvbox-plus-icons}/share/icons/Gruvbox-Plus-Light/index.theme");

  programs.vicinae = {
    enable = true;
    systemd = {
      enable = true;
      autoStart = true; # default: false
    };
    settings = {
      close_on_focus_loss = true;
      consider_preedit = true;
      pop_to_root_on_close = true;
      favicon_service = "twenty";
      search_files_in_root = true;
      font = {
        normal = {
          size = 12;
        };
      };
      launcher_window.opacity = lib.mkForce 1.0;

      themes = {
        light = {
          name = "stylix";
          icon_theme = "Gruvbox-Plus-Light";
        };
        dark = {
          name = "stylix";
          icon_theme = "Gruvbox-Plus-Dark";
        };
      };
    };
    extensions = with inputs.vicinae-extensions.packages.${pkgs.stdenv.hostPlatform.system}; [
      nix
      power-profile
      awww-switcher
      protondb-search
      aria2-manager
    ];
  };
}
