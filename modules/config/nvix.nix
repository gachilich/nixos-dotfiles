{ inputs, pkgs, config, ... }:
let
  system = pkgs.stdenv.hostPlatform.system;

  nvix = inputs.nvix.packages.${system}.default.extend (
    { lib, ... }:
    {
      imports = [ config.stylix.targets.nixvim.exportedModule ];
      plugins.render-markdown.settings.latex.enabled = false;
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
  environment.systemPackages = [
    nvix
    pkgs.lazygit
    pkgs.tree-sitter
  ];

  stylix.targets.nixvim.colors.enable = true;
  stylix.targets.nixvim.enable = true;
}
