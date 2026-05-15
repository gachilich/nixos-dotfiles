{ config, ... }: {
  home = {
    username      = "gachilich";
    homeDirectory = "/home/gachilich";
    stateVersion  = "24.11";
  };
  programs.home-manager.enable = true;
}
