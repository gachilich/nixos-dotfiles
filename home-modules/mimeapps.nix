{ ... }:{
  xdg.mimeApps = {
    enable = true;
     defaultApplications = {
      "text/html"               = "zen-twilight.desktop";
      "x-scheme-handler/http"   = "zen-twilight.desktop";
      "x-scheme-handler/https"  = "zen-twilight.desktop";
      "x-scheme-handler/tg"     = "org.telegram.desktop.desktop";
      "application/pdf"         = "zen-twilight.desktop";
      "image/png"               = "qimgv.desktop";
      "image/gif"               = "qimgv.desktop";
      "image/jpeg"              = "qimgv.desktop";
      "image/svg+xml"           = "qimgv.desktop";
      "image/webp"              = "qimgv.desktop";
      "video/mp4"               = "mpv.desktop";
      "video/mkv"               = "mpv.desktop";
      "text/plain"              = "nvim.desktop";
      "application/json"        = "nvim.desktop";
      "inode/directory"         = "thunar.desktop";
      "audio/mpeg"              = "org.strawberrymusicplayer.strawberry.desktop";
      "audio/flac"              = "org.strawberrymusicplayer.strawberry.desktop";
      "application/zip"         = "org.kde.ark.desktop";
      "application/x-tar"       = "org.kde.ark.desktop";
      "x-scheme-handler/terminal"= "kitty.desktop";
    };
  };
}
