{ ... }:
{
  boot.kernelModules = [ "kvm-intel" "kvm" ];
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  virtualisation.libvirtd.onBoot = "ignore";
  boot.blacklistedKernelModules = [ "serial8250" ];
}
