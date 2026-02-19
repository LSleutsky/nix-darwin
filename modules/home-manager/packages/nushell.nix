{ config, lib, pkgs, ... }:

{
  programs.nushell = {
    enable = true;

    extraConfig = ''
      $env.config = {
        show_banner: false
        history: {
          max_size: 20000
          sync_on_enter: true
          file_format: "sqlite"
          isolation: false
        }
        completions: {
          case_sensitive: false
          quick: true
          partial: true
          algorithm: "fuzzy"
          external: {
            enable: true
            max_results: 100
            completer: null
          }
        }
        highlight_resolved_externals: true
        keybindings: [
          {
            name: history_search_up
            modifier: control
            keycode: char_k
            mode: [emacs, vi_normal, vi_insert]
            event: { send: up }
          }
          {
            name: history_search_down
            modifier: control
            keycode: char_j
            mode: [emacs, vi_normal, vi_insert]
            event: { send: down }
          }
          {
            name: forward_word
            modifier: control
            keycode: right
            mode: [emacs, vi_normal, vi_insert]
            event: { edit: movewordright }
          }
          {
            name: backward_word
            modifier: control
            keycode: left
            mode: [emacs, vi_normal, vi_insert]
            event: { edit: movewordleft }
          }
          {
            name: backward_kill_word
            modifier: control
            keycode: char_w
            mode: [emacs, vi_insert]
            event: { edit: backspaceword }
          }
        ]
        edit_mode: vim
      }
    '';
    extraEnv = ''
      $env.ANDROID_HOME = $"($env.HOME)/Library/Android/sdk"
      $env.BUN_INSTALL = $"($env.HOME)/.bun"
      $env.NVM_DIR = $"($env.HOME)/.config/nvm"

      $env.PATH = ($env.PATH | split row (char esep)
        | prepend $"($env.HOME)/.bun/bin"
        | prepend "/Library/Frameworks/Python.framework/Versions/3.14/bin"
        | append $"($env.ANDROID_HOME)/emulator"
        | append $"($env.ANDROID_HOME)/platform-tools"
        | append $"($env.HOME)/go/bin"
      )
    '';
    shellAliases = {
      cls = "clear";
      df = "df -h";
      ff = "fastfetch";
      gaa = "git add --all";
      gac = "git add --all; git commit -m";
      gcb = "git checkout -b";
      gcm = "git commit -m";
      gco = "git checkout";
      gd = "git diff";
      gdn = "git diff --name-only";
      gfp = "git fetch --all --prune";
      gp = "git push";
      gl = "git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
      gsb = "git status -sb";
      grep = "grep --color=auto";
      mkdir = "mkdir -p";
      n = "nvim";
      sn = "sudo -Es nvim";
      nb = "nvim $HOME/.config/nix-darwin/hosts/darwin/services/homebrew.nix";
      nd = "nvim $HOME/.config/nix-darwin/hosts/darwin/default.nix";
      nf = "nvim $HOME/.config/nix-darwin/flake.nix";
      nh = "nvim $HOME/.config/nix-darwin/modules/home-manager/default.nix";
      nz = "nvim $HOME/.config/nix-darwin/modules/home-manager/packages/zsh.nix";
      ngc = "nix-collect-garbage --delete-old; sudo nix-collect-garbage -d";
      rd = "rm -rf .DS_Store";
      tree = "tree -a -C -I '.git' -I 'node_modules'";
      dir = "tree -ad -C -I '.git' -I 'node_modules'";
    };
  };
}