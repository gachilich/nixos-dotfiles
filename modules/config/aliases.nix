{ ... }:
{
  environment.shellAliases = {
    spf = "superfile";
    nixupdate = "sudo nix flake update";
    nixrebuid = "sudo nixos-rebuild switch --flake .#gachinix";
    nixclear = "sudo nix-collect-garbage -d";
    nixgit = "git add -A && git commit -m";
    gpart = "sudo -E WAYLAND_DISPLAY=$WAYLAND_DISPLAY XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR gparted";
  };
}
