{ config, lib, ... }:
let
  c = config.lib.stylix.colors.withHashtag;
  palette = ''
    :root {
      --t24-bg: ${c.base00};
      --t24-panel: ${c.base01};
      --t24-hover: ${c.base02};
      --t24-border: ${c.base03};
      --t24-muted: ${c.base04};
      --t24-fg: ${c.base05};
      --t24-accent: ${c.base0D};
      --t24-error: ${c.base08};
      --t24-warning: ${c.base0A};
      --t24-font: ${builtins.toJSON config.stylix.fonts.monospace.name}, monospace;
      --t24-font-size: ${toString config.stylix.fonts.sizes.applications}pt;
    }
  '';
in
{
  # Keep Stylix's fonts, polarity, container colors and internal-page styling.
  # Append our rules after its CSS; every theme color comes from the same palette.
  programs.zen-browser.profiles.gachilich = {
    userChrome = lib.mkAfter (palette + builtins.readFile ./userChrome.css);
    userContent = lib.mkAfter (palette + builtins.readFile ./userContent.css);
    settings."toolkit.legacyUserProfileCustomizations.stylesheets" = true;

    # Other installed mods override backgrounds, tab borders and URL bar layout.
    # The original list is retained in zen.nix and restored by removing this import.
    mods = lib.mkForce [
      "b51ff956-6aea-47ab-80c7-d6c047c0d510" # Disable Status Bar
      "4ab93b88-151c-451b-a1b7-a1e0e28fa7f8" # No Sidebar Scrollbar
      "e122b5d9-d385-4bf8-9971-e137809097d0" # No Top Sites
      "5941aefd-67b0-453d-9b62-9071a31cbb0d" # Smaller Compact Mode
    ];
  };
}
