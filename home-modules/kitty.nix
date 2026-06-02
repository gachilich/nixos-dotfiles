{  ... }:
{
  programs.kitty = {
    enable = true;
    extraConfig = ''
      background_opacity 0.6
      confirm_os_window_close 0
    '';
  };
}
