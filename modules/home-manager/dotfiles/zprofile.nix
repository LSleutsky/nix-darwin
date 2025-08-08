{
  home.file.".zprofile" = {
    enable = true;
    text = ''
      if [[ "$TERM" == "xterm-ghostty" ]]; then
        export TERM="xterm-256color"
      fi
    '';
  };
}
