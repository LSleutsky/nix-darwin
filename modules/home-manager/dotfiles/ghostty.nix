{
  xdg.configFile."ghostty/config" = {
    enable = true;
    text = ''
      confirm-close-surface = false
      font-family = "BerkeleyMono Nerd Font"
      font-size = 10
      theme = /Applications/Ghostty.app/Contents/Resources/ghostty/themes/Catppuccin Mocha
      window-save-state = always
      keybind = shift+enter=text:\n
      macos-option-as-alt = true
      window-padding-x = 10
      window-padding-y = 10
      cursor-style = "block"
      cursor-style-blink = false
      window-colorspace = "display-p3"
      maximize = true
    '';
  };
}