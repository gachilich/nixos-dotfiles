{ inputs, self, ... }:

{
  flake.nixosConfigurations = {
    gachinix = inputs.nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      specialArgs = {
        inherit inputs self;
        nix-cachyos-kernel = inputs.nix-cachyos-kernel;
      };

      modules = [
        (inputs.import-tree "${self}/modules")

        inputs.determinate.nixosModules.default
        inputs.home-manager.nixosModules.home-manager
        inputs.nix-flatpak.nixosModules.nix-flatpak
        # inputs.mangowm.nixosModules.mango
        inputs.niri.nixosModules.niri
        inputs.stylix.nixosModules.stylix
        inputs.musnix.nixosModules.musnix
        # inputs.nix-cachyos-kernel.nixosModules.cachyos
        ./overlays.nix
      ];
    };
  };
}
