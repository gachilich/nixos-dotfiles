{  ... }:
{
  programs.kitty = {
    enable = true;
    extraConfig = ''
      background_opacity 0.7
      confirm_os_window_close 0
    '';
  };
}
