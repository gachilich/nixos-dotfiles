{ inputs, ... }:
{
  imports = [ inputs.nixcord.homeModules.nixcord ];

  programs.nixcord = {
    enable = true;
    discord.enable = false;
    vesktop.enable = true;

    quickCss = ''
  :root {
    --colors: on !important;
    --text-0: #1d2021 !important;
    --text-1: #f2efde !important;
    --text-2: #ebdbb2 !important;
    --text-3: #d5c4a1 !important;
    --text-4: #bdae93 !important;
    --text-5: #928374 !important;
    --bg-1: #3c3836 !important;
    --bg-2: #32302f !important;
    --bg-3: #282828 !important;
    --bg-4: #1d2021 !important;
  }

  @media (prefers-color-scheme: light) {
    :root {
      --text-0: #f9f5d7 !important;
      --text-1: #282828 !important;
      --text-2: #3c3836 !important;
      --text-3: #504945 !important;
      --text-4: #665c54 !important;
      --text-5: #928374 !important;

      --bg-1: #ebdbb2 !important;
      --bg-2: #f2e5bc !important;
      --bg-3: #f9f5d7 !important;
      --bg-4: #fbf1c7 !important;
    }
  }
  code.hljs.txt,
  [class*="codeView"].hljs.txt {
    color: #282828 !important;
    background-color: #fbf1c7 !important;
  }

  code.hljs.txt *,
  [class*="codeView"].hljs.txt * {
    color: #282828 !important;
  }
  @media (prefers-color-scheme: dark) {
  code.hljs.txt,
  [class*="codeView"].hljs.txt {
    color: #d4be98 !important;
    background-color: #1d2021 !important;
  }

  code.hljs.txt *,
  [class*="codeView"].hljs.txt * {
    color: #d4be98 !important;
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
