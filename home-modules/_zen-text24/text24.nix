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
      --t24-radius: 4px;
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

    # Use the user's mod list from zen.nix.
  };
}
