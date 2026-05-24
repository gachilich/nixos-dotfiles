{ ... }: {
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
    ];
  };

  # Убеждаемся что flatpak-сервис ждёт сети
  systemd.services.flatpak-managed-install = {
    after = [ "network-online.target" ];
    wants = [ "network-online.target" ];
  };
}
