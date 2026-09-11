{ ... }:
{
  musnix = {
    enable = true;

    kernel.realtime = false;

    alsaSeq.enable = true;

    soundcardPciId = "";

    rtirq.enable = true;
    rtcqs.enable = true;

    das_watchdog.enable = true;
  };
}
