{ inputs, ... }:
{
  imports = [ inputs.nixcord.homeModules.nixcord ];

  programs.nixcord = {
    enable = true;
    discord.enable = false;
    vesktop.enable = true;

    quickCss = ''
      :root {
        --bg-4: #ffefd8;
        --bg-3: #eae1c8;
        --bg-2: #d8cdb8;
        --bg-1: #c9b99a;
        --hover:    color-mix(in srgb, #7c6f64 10%, transparent);
        --active:   color-mix(in srgb, #7c6f64 20%, transparent);
        --active-2: color-mix(in srgb, #7c6f64 30%, transparent);
        --text-0: #f2efde;
        --text-1: #2a1f1d;
        --text-2: #3c3836;
        --text-3: #4f3829;
        --text-4: #7c6f64;
        --text-5: #bfb695;
        --border-light: color-mix(in srgb, #7c6f64 10%, transparent);
        --border:       color-mix(in srgb, #7c6f64 20%, transparent);
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
