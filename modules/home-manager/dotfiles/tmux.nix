{
  home.file.".tmux.conf" = {
    enable = true;
    text = ''
      set -g mouse on
      set -g base-index 1
      set -g history-limit 50000

      setw -g pane-base-index 1
    '';
  };
}
