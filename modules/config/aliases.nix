{ ... }:{

  environment.shellAliases = {
  spf = "superfile";
  nixupdate = "sudo nix flake update";
  nixrebuid = "sudo nixos-rebuild switch --flake .#gachinix";
  nixclear = "sudo nix-collect-garbage -d";
  nixgit = "git add -A && git commit -m";
  gpart = "sudo -E WAYLAND_DISPLAY=$WAYLAND_DISPLAY XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR gparted";
  awww-light = "awww /home/gachilich/nixos-dotfiles/nixpics/Wallpapers/wallhaven_1qdk61.jpg";
  awww-dark = "awww /home/gachilich/nixos-dotfiles/nixpics/Wallpapers/wallhaven-85eqe2.png";
  };


  }
