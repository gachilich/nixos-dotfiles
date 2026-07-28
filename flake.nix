{
  description = "NixOS from Trash";

  inputs = {

    determinate.url = "https://flakehub.com/f/DeterminateSystems/determinate/*";

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    home-manager.url = "github:nix-community/home-manager";

    flake-parts.url = "github:hercules-ci/flake-parts";

    import-tree.url = "github:vic/import-tree";

    mangowm.url = "github:mangowm/mango";

    niri.url   = "github:sodiboo/niri-flake";

    noctalia.url = "github:noctalia-dev/noctalia-shell";

    nix-flatpak.url = "github:gmodena/nix-flatpak";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";

    firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";

    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    nixcord.url = "github:FlameFlag/nixcord";

    wrapper-modules.url = "github:BirdeeHub/nix-wrapper-modules";

    nvix.url = "github:niksingh710/nvix";

    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel";

    musnix.url = "github:musnix/musnix";

    stylix.url = "github:nix-community/stylix";

    vicinae.url = "github:vicinaehq/vicinae";

    vicinae-extensions.url = "github:vicinaehq/extensions";

    areofyl-fetch.url = "github:areofyl/fetch";

    helium.url = "github:AlvaroParker/helium-nix";

  };

  outputs = inputs@{ flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = [
        ./parts/nixos.nix
      ];
      systems = [ "x86_64-linux" ];
    };
}
