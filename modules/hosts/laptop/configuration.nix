{ pkgs, ... }:
{
  nixpkgs.config.allowUnfree = true;

  imports = [
    ./hardware-configuration.nix
  ];

  boot.loader.grub.mirroredBoots = [];

  boot.kernel.sysctl = {
    "net.core.default_qdisc" = "fq";
    "net.ipv4.tcp_congestion_control" = "bbr";
  };

  boot.supportedFilesystems = [ "ntfs" ];

  fileSystems."/mnt/data" = {
    device = "/dev/disk/by-uuid/ed0bf9b7-4055-46be-b770-ea6c4b371771";
    fsType = "ext4";
    options = [ "defaults" "nofail" ];
  };

  fileSystems."/mnt/windows" = {
    device = "/dev/disk/by-uuid/282CEB042CEACC3E";
    fsType = "ntfs3";
    options = [ "rw" "uid=1000" "nofail" ]; # Replace 1000 with your UID
  };


  zramSwap.enable = true;

  hardware.bluetooth = {
  enable = true;
  powerOnBoot = true;
  settings = {
    General = {
      Experimental = true;
      FastConnectable = true;
    };
    Policy = {
      AutoEnable = false;
     };
    };
  };

  services.printing.enable = true;

  services.ipp-usb.enable = true;

  systemd.oomd.enable = true;

  networking.hostName = "gachinix";
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Yerevan";

  i18n.defaultLocale = "en_US.UTF-8";

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXOS_OZONE_WL = "1";
  };

  services.udisks2.enable = true;

  services.libinput.enable = true;

  security.pam.loginLimits = [
    { domain = "@audio"; type = "-"; item = "memlock"; value = "unlimited"; }
    { domain = "gachilich"; type = "-"; item = "memlock"; value = "unlimited"; }
  ];

  users.users.gachilich = {
    isNormalUser = true;
    shell = pkgs.fish;
    extraGroups = [ "wheel" "audio" "sound" "video" "realtime" "i2c" "docker" ];
    packages = with pkgs; [ tree ];
  };

  programs.fish.enable = true;

  environment.systemPackages = with pkgs; [
    wget
    gcc
    fd
    eza
    duf
    winetricks
    openssl
    ffmpeg
    efibootmgr
  ];

  virtualisation.docker = {
    enable = true;
  };

  fonts.packages = with pkgs; [
    noto-fonts
    ipafont
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  system.stateVersion = "25.11";
}
