{ inputs, pkgs, ... }:
let
  firefox-addons = inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system};
in
{
  imports = [ inputs.zen-browser.homeModules.twilight ];

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
    policies = {
      AutofillAddressEnabled = true;
      AutofillCreditCardEnabled = false;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };
    };
    profiles.gachilich = {
      extensions.packages = with firefox-addons; [
        ublock-origin
        bitwarden
        return-youtube-dislikes
      ];
      mods = [
        "f4866f39-cfd6-4498-ab92-54213b8279dc" # Animations Plus
        "a6335949-4465-4b71-926c-4a52d34bc9c0" # Better Find Bar
        "f7c71d9a-bce2-420f-ae44-a64bd92975ab" # Better Unloaded Tabs
        "664c54f9-d97d-410b-a479-23dd8a08a628" # Better Tab Indicators
        "a5f6a231-e3c8-4ce8-8a8e-3e93efd6adec" # Cleaned URL bar
        "b51ff956-6aea-47ab-80c7-d6c047c0d510" # Disable Status Bar
        "4ab93b88-151c-451b-a1b7-a1e0e28fa7f8" # No Sidebar Scrollbar
        "e122b5d9-d385-4bf8-9971-e137809097d0" # No Top Sites
        "5941aefd-67b0-453d-9b62-9071a31cbb0d" # Smaller Compact Mode
        "570afd9d-96fa-48b5-bad3-0c106757cce9" # Super Sleek UI
        "642854b5-88b4-4c40-b256-e035532109df" # Transparent Zen
        "81fcd6b3-f014-4796-988f-6c3cb3874db8" # Zen Context Menu
        "c6813222-6571-4ba6-8faf-58f3343324f6" #Disable Rounded Corners
      ];

      search = {
        force = true;
        default = "SearXNG";
        engines = {
          "SearXNG" = {
            urls = [
              {
                template = "http://127.0.0.1:8888/search";
                params = [
                  { name = "q"; value = "{searchTerms}"; }
                ];
              }
            ];
            icon = "http://127.0.0.1:8888/favicon.ico";
            definedAliases = [ "@sx" ];
          };
        };
      };
    };
  };
  stylix.targets.zen-browser.profileNames = [ "gachilich" ];
}
