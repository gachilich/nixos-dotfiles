{ pkgs, ... }:
{
  programs.fish = {
    enable =true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      if status is-interactive
        fastfetch
      end
    '';
    plugins = [
      {
        name = "z";
        src = pkgs.fishPlugins.z.src;
      }
      {
        name = "fzf-fish";
        src = pkgs.fishPlugins.fzf-fish.src;
      }
      {
        name = "tide";
        src = pkgs.fishPlugins.tide.src;
      }
    ];
    shellAliases = {
      spf = "superfile";
      nixupdate = "sudo nix flake update";
      nixrebuid = "sudo nixos-rebuild switch --flake .#gachinix";
      nixclear = "sudo nix-collect-garbage -d";
      nixgit = "git add -A && git commit -m";
      gpart = "sudo -E WAYLAND_DISPLAY=$WAYLAND_DISPLAY XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR gparted";
    };
  };
}
