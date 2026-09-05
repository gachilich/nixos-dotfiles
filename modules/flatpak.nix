{ ... }:
{
  services.flatpak = {
    enable = true;
    remotes = [{
      name = "flathub";
      location = "https://dl.flathub.org/repo/flathub.flatpakrepo";
    }];
    update.onActivation = true;
    packages = [
      { appId = "org.libreoffice.LibreOffice"; origin = "flathub"; }
      { appId = "ru.linux_gaming.PortProton"; origin = "flathub"; }
      { appId = "org.gnome.SimpleScan"; origin = "flathub"; }
      { appId = "com.github.tchx84.Flatseal"; origin = "flathub"; }
      { appId = "org.vinegarhq.Sober"; origin = "flathub"; }
    ];
  };
  systemd.services.flatpak-managed-install = {
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
  };
}
