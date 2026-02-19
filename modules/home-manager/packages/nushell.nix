{ config, lib, pkgs, ... }:

{
  programs.nushell = {
    enable = true;
    extraConfig = ''
      def gac [message: string] {
        git add --all
        git commit -m $message
      }

      def ngc [] {
        nix-collect-garbage --delete-old
        sudo nix-collect-garbage -d
      }

      $env.config = ($env.config | merge {
        show_banner: false
        highlight_resolved_externals: true
        edit_mode: vi
        color_config: {
          shape_external: red
          shape_external_resolved: green
          shape_internalcall: cyan
          shape_garbage: { fg: red attr: b }
        }
        history: {
          max_size: 100000
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
        keybindings: [
          {
            name: history_search_up
            modifier: control
            keycode: char_k
            mode: [emacs vi_normal vi_insert]
            event: { send: up }
          }
          {
            name: history_search_down
            modifier: control
            keycode: char_j
            mode: [emacs vi_normal vi_insert]
            event: { send: down }
          }
          {
            name: backward_kill_word
            modifier: control
            keycode: char_w
            mode: [emacs vi_insert]
            event: { edit: backspaceword }
          }
          {
            name: clear_line
            modifier: control
            keycode: char_u
            mode: [emacs vi_normal vi_insert]
            event: [
              { edit: cutfromstart }
            ]
          }
          {
            name: backward_kill_word
            modifier: control
            keycode: char_w
            mode: [emacs vi_insert]
            event: [
              { edit: cutwordleft }
            ]
          }
        ]
      })
    '';
    extraEnv = ''
      $env.PROMPT_INDICATOR = ""
      $env.PROMPT_INDICATOR_VI_INSERT = ""
      $env.PROMPT_INDICATOR_VI_NORMAL = ""
      $env.ANDROID_HOME = $"($env.HOME)/Library/Android/sdk"
      $env.BUN_INSTALL = $"($env.HOME)/.bun"
      $env.PATH = ($env.PATH | split row (char esep)
        | prepend "/usr/local/bin"
        | prepend "/etc/profiles/per-user/lush/bin"
        | prepend "/run/current-system/sw/bin"
        | prepend "/nix/var/nix/profiles/default/bin"
        | prepend $"($env.HOME)/.nix-profile/bin"
        | prepend $"($env.HOME)/.bun/bin"
        | prepend "/Library/Frameworks/Python.framework/Versions/3.14/bin"
        | append $"($env.ANDROID_HOME)/emulator"
        | append $"($env.ANDROID_HOME)/platform-tools"
        | append $"($env.HOME)/go/bin"
      )

      load-env (fnm env --json | from json)
      $env.PATH = ($env.PATH | prepend $"($env.FNM_MULTISHELL_PATH)/bin")
    '';
    shellAliases = {
      cls = "clear";
      df = "df -h";
      ff = "fastfetch";
      gaa = "git add --all";
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
      n = "nvim";
      sn = "sudo -Es nvim";
      nb = "nvim ~/.config/nix-darwin/hosts/darwin/services/homebrew.nix";
      nd = "nvim ~/.config/nix-darwin/hosts/darwin/default.nix";
      nf = "nvim ~/.config/nix-darwin/flake.nix";
      nh = "nvim ~/.config/nix-darwin/modules/home-manager/default.nix";
      nz = "nvim ~/.config/nix-darwin/modules/home-manager/packages/zsh.nix";
      rd = "rm -rf .DS_Store";
      tree = "tree -a -C -I '.git' -I 'node_modules'";
      dir = "tree -ad -C -I '.git' -I 'node_modules'";
    };
  };
}