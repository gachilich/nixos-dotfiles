{ pkgs, ... }:
{
  programs.fish = {
    enable =true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      if status is-interactive
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
      nixupdate = "sudo nix flake update";
      nixrebuid = "sudo nixos-rebuild switch --flake .#gachinix";
      nixtest = "sudo nixos-rebuild test --flake .#gachinix";
      nixboot = "sudo nixos-rebuild boot --flake .#gachinix";
      nixclear = "sudo nix-collect-garbage -d";
      nixgit = "git add -A && git commit -m";
      gpart = "sudo -E WAYLAND_DISPLAY=$WAYLAND_DISPLAY XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR gparted";
      ff = "clear && fastfetch";
      f = "clear && fetch";
      awwwback = "awww img --namespace backdrop --transition-type wipe --transition-duration 3";
    };
  };
}
