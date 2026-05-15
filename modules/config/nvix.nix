{ inputs, pkgs, config, ... }:
let
  system = pkgs.stdenv.hostPlatform.system;

  nvix-themed = inputs.nvix.packages.${system}.default.extend (
    { lib, ... }:
    {
      imports = [ config.stylix.targets.nixvim.exportedModule ];

      plugins.obsidian.settings.workspaces = [
        {
          name = "araOBSIDIAN";
          path = "~/documents/araOBSIDIAN";
        }
      ];
    }
  );
in
{
  environment.systemPackages = [ nvix-themed ];

  stylix.targets.nixvim.colors.enable = true;
  stylix.targets.nixvim.enable = true;
}
