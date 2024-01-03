{
  home.file.".nanorc" = {
    enable = true;
    text = ''
      set tabsize 2
      set trimblanks
      set linenumbers
      set constantshow
      set titlecolor white,red
      set spotlightcolor black,yellow
      set keycolor cyan
      set functioncolor cyan
      set numbercolor yellow
      set zap
      set indicator
      set mouse
      set nonewlines
      set emptyline
      set brackets "(<[{)>]}"
      set matchbrackets "(<[{)>]}"
      set breaklonglines
      set smarthome
      set multibuffer

      include "/usr/local/share/nano/*.nanorc"
      include "/usr/local/share/nano/extra/*.nanorc"

      bind ^C copy main
      bind ^V paste main
      bind ^F whereis all
      bind ^S savefile main
    '';
  };
}
