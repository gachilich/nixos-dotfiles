{ pkgs, ... }:{

  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.timeout = 5;
  boot.loader.grub = {
  enable = true;
  device = "nodev";
  efiSupport = true;
  useOSProber = true;

  theme = pkgs.fetchFromGitHub {
    owner = "uiriansan";
    repo  = "LainGrubTheme";
    rev   = "main";
    hash  = "sha256-gDwNolJ28UQUjE2G2U0bvzh29E9EEiet9SlItbY46IQ=";
  } + "/lain";

  gfxmodeEfi = "1920x1080";
  gfxmodeBios = "1920x1080";
  };
}
