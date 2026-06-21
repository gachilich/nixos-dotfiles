{ ... }:
{
  musnix = {
    enable = true;

    kernel.realtime = false;

    alsaSeq.enable = true;

    soundcardPciId = "";

    rtirq.enable = true;

    das_watchdog.enable = true;
  };
}
