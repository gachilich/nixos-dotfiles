{ ... }:{
  xdg.desktopEntries.nvim = {
    name = "Neovim";
    genericName = "Text Editor";
    exec = "kitty -- nvim %F";
    terminal = false;
    icon = "nvim";
    categories = [ "Utility" "TextEditor" ];
    mimeType = [
      "text/plain"
      "text/markdown"
      "text/x-readme"
      "text/x-log"
      "text/x-script"
      "text/x-python"
      "text/x-lua"
      "text/x-c"
      "text/x-csrc"
      "text/x-chdr"
      "text/x-c++"
      "text/x-java"
      "text/x-rust"
      "text/x-go"
      "text/x-haskell"
      "text/x-nix"
      "text/x-shellscript"
      "text/x-sh"
      "application/json"
      "application/toml"
      "application/x-yaml"
      "application/xml"
      "application/javascript"
      "application/typescript"
    ];
    comment = "Edit text files";
  };
  xdg.desktopEntries.btop = {
  name = "btop";
  genericName = "System Monitor";
  exec = "kitty -- btop";
  terminal = false;
  icon = "btop";
  categories = [ "System" "Monitor" ];
  };
}
