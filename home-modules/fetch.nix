{ inputs, ... }:

{
  imports = [ inputs.areofyl-fetch.homeManagerModules.default ];

  programs.fetch = {
    enable = true;
    labelColor = "green";
    separator = "─";
    info = [
      "cpu"
      "gpu"
      "disk"
      "os"
      "kernel"
      "packages"
      "wm"
      "uptime"
      "colors"
    ];
    speed = 0.5;
    size = 2.0;
    shading = "█░.M";
    spin = "xy";
    height = 20;
  };

}
