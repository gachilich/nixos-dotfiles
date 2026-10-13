{ pkgs, ... }:
{
  programs.fish = {
    enable =true;
    interactiveShellInit = ''
      set fish_greeting
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
      nh-switch = "nh os switch . -H gachinix --no-nom";
      nh-test = "nh os test . -H gachinix --no-nom";
      nh-boot = "nh os boot . -H gachinix --no-nom";
      nh-clear = "nh clean all --ask";
      nixgit = "git add -A && git commit -m";
      gpart = "sudo -E WAYLAND_DISPLAY=$WAYLAND_DISPLAY XDG_RUNTIME_DIR=$XDG_RUNTIME_DIR gparted";
      ff = "clear && fastfetch";
      f = "clear && fetch";
      awwwback = "awww img --namespace backdrop --transition-type wipe --transition-duration 3";
      awwwback-dark = "awww img --namespace backdrop --transition-type wipe --transition-duration 3 /home/gachilich/nixos-dotfiles/nixpics/Wallpapers/gruvcity_blur.png";
      awwwback-light = "awww img --namespace backdrop --transition-type wipe --transition-duration 3 /home/gachilich/nixos-dotfiles/nixpics/Wallpapers/berseks_blur.png";
      mpc-on = "systemctl --user start mcp-filesystem mcp-searxng";
      mpc-off = "systemctl --user stop mcp-filesystem mcp-searxng";
      llma-cpp-on = "sudo systemctl start llama-cpp";
      llma-cpp-off = "sudo systemctl stop llama-cpp";
    };
  };
 }
