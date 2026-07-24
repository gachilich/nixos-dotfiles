{ inputs, config,  ... }:
let
  c = config.lib.stylix.colors.withHashtag;
in
{
  imports = [ inputs.nixcord.homeModules.nixcord ];

  programs.nixcord = {
    enable = true;
    discord.enable = false;
    vesktop.enable = true;

    quickCss = ''
      :root {
        --colors: on !important;
        --text-0: ${c.base00} !important;
        --text-1: ${c.base06} !important;
        --text-2: ${c.base05} !important;
        --text-3: ${c.base04} !important;
        --text-4: ${c.base03} !important;
        --text-5: ${c.base02} !important;
        --bg-1: ${c.base01} !important;
        --bg-2: ${c.base00} !important;
        --bg-3: ${c.base00} !important;
        --bg-4: ${c.base00} !important;
      }

      code[class*="hljs"],
      [class*="codeView"][class*="hljs"] {
        color: ${c.base05} !important;
        background-color: ${c.base00} !important;
      }

      code[class*="hljs"] *,
      [class*="codeView"][class*="hljs"] * {
        color: ${c.base05} !important;
      }
    '';

  config = {
      useQuickCss = true;
      themeLinks = [
        "https://raw.githubusercontent.com/refact0r/system24/refs/heads/main/theme/system24.theme.css"
      ];
      frameless = true;
    };
  };
  stylix.targets.vesktop.colors.enable = true;
  stylix.targets.vesktop.enable = true;
}
