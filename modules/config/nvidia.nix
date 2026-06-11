{ config, ... }:
{
  config = {
    boot.kernelParams = [ "nvidia-drm.modeset=1" ];
    hardware.graphics = {
      enable = true;
      enable32Bit = true;
    };

    hardware.nvidia = {
    # forceFullCompositionPipeline = true;
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      open = true;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };

    services.xserver.enable = true;
    services.xserver.videoDrivers = [ "nvidia" ];

  };
}
