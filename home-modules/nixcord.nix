{ inputs, ... }:
{
  imports = [ inputs.nixcord.homeModules.nixcord ];

  programs.nixcord = {
    enable = true;
    discord.enable = false;
    vesktop.enable = true;

    quickCss = ''
      :root {
        --colors: on;
        --text-0: #1d2021;
        --text-1: #f2efde;
        --text-2: #ebdbb2;
        --text-3: #d5c4a1;
        --text-4: #bdae93;
        --text-5: #928374;
        --bg-1: #3c3836;
        --bg-2: #32302f;
        --bg-3: #282828;
        --bg-4: #1d2021;
      }

      @media (prefers-color-scheme: light) {
        :root {
          --text-0: #f9f5d7;
          --text-1: #282828;
          --text-2: #3c3836;
          --text-3: #504945;
          --text-4: #665c54;
          --text-5: #928374;

          --bg-1: #ebdbb2;
          --bg-2: #f2e5bc;
          --bg-3: #f9f5d7;
          --bg-4: #fbf1c7;
        }
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
