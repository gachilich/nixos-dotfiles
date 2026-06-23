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
    jack.enable = true;
  };

  services.pipewire.extraConfig.pipewire."92-low-latency" = {
    context.properties = {
      default.clock.rate = 48000;
      default.clock.quantum = 512;
      default.clock.min-quantum = 256;
      default.clock.max-quantum = 1024;
      "pulse.min.req" = "256/48000";
      "pulse.default.req" = "512/48000";
      "pulse.min.quantum" = "256/48000";
    };
  };
  systemd.tmpfiles.rules = [
    "w /sys/class/rtc/rtc0/max_user_freq - - - - 2048"
    "w /proc/sys/dev/hpet/max-user-freq  - - - - 2048"
  ];
}
