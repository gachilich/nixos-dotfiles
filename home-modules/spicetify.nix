{ pkgs, inputs, config, ... }:
let
  spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};

  progressBarCss = ''
    .progress-bar,
    [data-testid="progress-bar"] {
      --fg-color: #${config.lib.stylix.colors.base0A} !important;
      --mg-color: #${config.lib.stylix.colors.base0A} !important;
      --bg-color: #${config.lib.stylix.colors.base02} !important;
    }
  '';
in
{
  imports = [
    inputs.spicetify-nix.homeManagerModules.default
  ];

  programs.spicetify = {
    enable = true;

    theme = spicePkgs.themes.text // {
      additionalCss = (spicePkgs.themes.text.additionalCss or "") + progressBarCss;
    };

    colorScheme = "custom";
    customColorScheme = {
      text         =       "${config.lib.stylix.colors.base05}";
      subtext      =       "${config.lib.stylix.colors.base04}";
      sidebar-text =       "${config.lib.stylix.colors.base05}";
      main         =       "${config.lib.stylix.colors.base00}";
      sidebar      =       "${config.lib.stylix.colors.base01}";
      player       =       "${config.lib.stylix.colors.base00}";
      card         =       "${config.lib.stylix.colors.base01}";
      shadow       =       "${config.lib.stylix.colors.base00}";
      selected-row =       "${config.lib.stylix.colors.base02}";
      button       =       "${config.lib.stylix.colors.base0D}";
      button-active =      "${config.lib.stylix.colors.base0D}";
      button-disabled =    "${config.lib.stylix.colors.base03}";
      tab-active   =       "${config.lib.stylix.colors.base0D}";
      notification =       "${config.lib.stylix.colors.base0B}";
      notification-error = "${config.lib.stylix.colors.base08}";
      misc         =       "${config.lib.stylix.colors.base03}";
    };

    enabledExtensions = with spicePkgs.extensions; [
      adblock
      shuffle
      keyboardShortcut
      fullAlbumDate
      listPlaylistsWithSong
      history
      lastfm
      betterGenres
      savePlaylists
      aiBandBlocker
      sidebarCustomizer
    ];
  };

  stylix.targets.spicetify.colors.enable = false;
  stylix.targets.spicetify.enable = false;
}
