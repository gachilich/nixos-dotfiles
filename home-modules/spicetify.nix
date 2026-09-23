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

    button[aria-label="Play"] svg,
    button[data-testid="play-button"] svg,
    .main-playButton-PlayButton svg,
    .player-controls__buttons svg {
      fill: #${config.lib.stylix.colors.base0D} !important;
      color: #${config.lib.stylix.colors.base0D} !important;
    }

    button[aria-label="Play"] svg path,
    button[data-testid="play-button"] svg path {
      fill: #${config.lib.stylix.colors.base0D} !important;
    }

    button[aria-label="Play"]:hover svg,
    button[data-testid="play-button"]:hover svg {
      fill: #${config.lib.stylix.colors.base09} !important;
    }
  '';
  lyricsCss = ''
    .lyrics-lyricsContent-lyric,
    .lyrics-lyricsContent-line,
    .main-lyricsLyricsContainer-lyric,
    .main-lyricsLyricsContainer-line {
      color: #${config.lib.stylix.colors.base04} !important;
    }

    .lyrics-lyricsContent-lyric:hover,
    .lyrics-lyricsContent-line:hover,
    .main-lyricsLyricsContainer-lyric:hover,
    .main-lyricsLyricsContainer-line:hover {
      color: #${config.lib.stylix.colors.base05} !important;
    }

    .lyrics-lyricsContent-active,
    .lyrics-lyricsContent-lyric[aria-current="true"],
    .main-lyricsLyricsContainer-active,
    .main-lyricsLyricsContainer-lyric[aria-current="true"] {
      color: #${config.lib.stylix.colors.base00} !important;
      background: #${config.lib.stylix.colors.base0A} !important;
    }
  '';
  searchCss = ''
    .x-searchInput-searchInput,
    .main-trackList-trackListHeaderRow input,
    input[placeholder="Search in playlist"],
    input[data-testid="playlist-search-input"] {
      background-color: #${config.lib.stylix.colors.base01} !important;
      color: #${config.lib.stylix.colors.base05} !important;
      border: 1px solid #${config.lib.stylix.colors.base03} !important;
    }

    .x-searchInput-searchInput input,
    .x-searchInput-searchInput input::placeholder,
    .main-trackList-trackListHeaderRow input::placeholder,
    input[placeholder="Search in playlist"]::placeholder,
    input[data-testid="playlist-search-input"]::placeholder {
      color: #${config.lib.stylix.colors.base04} !important;
      opacity: 1 !important;
    }

    .x-searchInput-searchInput svg,
    .main-trackList-trackListHeaderRow svg {
      color: #${config.lib.stylix.colors.base04} !important;
      fill: #${config.lib.stylix.colors.base04} !important;
    }

    .x-searchInput-searchInput:focus-within,
    .main-trackList-trackListHeaderRow input:focus {
      border-color: #${config.lib.stylix.colors.base0D} !important;
      box-shadow: 0 0 0 1px #${config.lib.stylix.colors.base0D} !important;
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
      additionalCss =
        (spicePkgs.themes.text.additionalCss or "")
        + progressBarCss
        + lyricsCss
        + searchCss;
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
      aiBandBlocker
    ];
  };

  stylix.targets.spicetify.colors.enable = false;
  stylix.targets.spicetify.enable = false;
}
