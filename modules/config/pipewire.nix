{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    pavucontrol
    qpwgraph
  ];

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = false;
  };

  systemd.tmpfiles.rules = [
    "w /sys/class/rtc/rtc0/max_user_freq - - - - 2048"
    "w /proc/sys/dev/hpet/max-user-freq  - - - - 2048"
  ];
}
