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
  };
}
