{ ... }:{

  programs.fastfetch = {
  enable = true;
  settings = {
    logo = {
      source = "~/nixos-dotfiles/nixpics/nixlogorainbow.png";
      type = "auto";
      width = 24;
      height = 12;
      padding = {
        top = 1;
        left = 2;
      };
    };
    modules = [
      "break"
      {
        type = "custom";
        format = "┌───────────────────────────────────────────────────────┐";
      }
      "break"
      {
        type = "cpu";
        key = "󰻠 ";
        keyColor = "green";
      }
      {
        type = "gpu";
        key = "󰍹 ";
        keyColor = "green";
      }
      {
        type = "disk";
        key = "󰋊 ";
        keyColor = "green";
      }
      {
        type = "os";
        key = "󱄅 ";
        keyColor = "yellow";
      }
      {
        type = "kernel";
        key = "󰌽 ";
        keyColor = "yellow";
      }
      {
        type = "packages";
        key = "󰏗 ";
        keyColor = "yellow";
      }
      {
        type = "wm";
        key = "󱂬 ";
        keyColor = "blue";
      }
      "break"
      {
        type = "custom";
        format = "└───────────────────────────────────────────────────────┘";
      }
      {
        type = "command";
        key = "  ›  OS Age  ";
        keyColor = "magenta";
        text = "birth_install=$(stat -c %W /); current=$(date +%s); time_progression=$((current - birth_install)); days_difference=$((time_progression / 86400)); echo $days_difference days";
      }
      {
        type = "colors";
        paddingLeft = 2;
        symbol = "circle";
      }
    ];
  };
};
}
