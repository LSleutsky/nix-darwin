{ config, lib, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    autocd = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    dirHashes = {
      cfg = "$HOME/.config";
      dl = "$HOME/Downloads";
      docs = "$HOME/Documents";
      nx = "$HOME/.config/nix-darwin";
      nxh = "$HOME/.config/nix-darwin/hosts/darwin";
      nxm = "$HOME/.config/nix-darwin/modules/home-manager";
      nxp = "$HOME/.config/nix-darwin/modules/home-manager/packages";
      pics = "$HOME/Pictures";
      repos = "$HOME/.local/share/repos";
      vids = "$HOME/Videos";
    };
    history = {
      expireDuplicatesFirst = true;
      extended = true;
      ignoreAllDups = true;
      ignoreDups = true;
      ignoreSpace = true;
      path = "$HOME/.zsh_history";
      share = true;
      size = 20000;
    };
    historySubstringSearch = {
      enable = true;
      searchDownKey = ["^j"];
      searchUpKey = ["^k"];
    };
    shellAliases = {
      ".." = "cd ../";
      "..." = "cd ../../";
      "...." = "cd ../../../";
      "....." = "cd ../../../../";
      "......" = "cd ../../../../../";
      "......." = "cd ../../../../../../";
      "........" = "cd ../../../../../../../";
      "........." = "cd ../../../../../../../../";
      ".........." = "cd ../../../../../../../../../";
      clock = "tty-clock -bcsC4 -f %a,\\ %d\\ %b\\ %Y";
      cls = "clear && clear";
      cbonsai = "cbonsai --live --infinite";
      dir = "tree -ad -C -I '.git' -I 'node_modules'";
      df = "df -h";
      free = "free -mth";
      gaa = "git add --all";
      gac = "git add --all && git commit -m";
      gb = "git branch --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(contents:subject) %(color:green)(%(committerdate:relative)) [%(authorname)]' --sort=-committerdate";
      gbd = "git branch -D";
      gbD = "git push origin --delete";
      gcam = "git add --all && git commit --amend";
      gcb = "git checkout -b";
      gcm = "git commit -m";
      gco = "git checkout";
      gcod = "git checkout $(git_develop_branch)";
      gcof = "git checkout --";
      gcom = "git checkout $(git_main_branch)";
      gd = "git diff";
      gdf = "git diff ':!flake.lock'";
      gdn = "git diff --name-only";
      gfp = "git fetch --all --prune && git pull --rebase origin $(git symbolic-ref --short HEAD)";
      ggf = "git push --force origin $(git symbolic-ref --short HEAD)";
      ggp = "git push origin $(git symbolic-ref --short HEAD)";
      gl = "git log --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit";
      gpp = "git pull --rebase origin $(git symbolic-ref --short HEAD) && git push origin $(git symbolic-ref --short HEAD)";
      grb = "git rebase";
      grba = "git rebase --abort";
      grbc = "git rebase --continue";
      gsb = "git status -sb";
      grep = "grep --color=auto";
      gc = "nix-collect-garbage --delete-old && sudo nix-collect-garbage -d";
      history = "history -i";
      ip = "ipconfig getifaddr en0";
      ipv6 = "ifconfig | grep 'inet6' | grep -E -v '(fe80|fd69|::1)'";
      j = "__zoxide_z";
      man = "batman";
      mkdir = "mkdir -p";
      nb = "nvim $HOME/.config/nix-darwin/hosts/darwin/services/homebrew.nix";
      nd = "nvim $HOME/.config/nix-darwin/hosts/darwin/default.nix";
      nf = "nvim $HOME/.config/nix-darwin/flake.nix";
      nh = "nvim $HOME/.config/nix-darwin/modules/home-manager/default.nix";
      nz = "nvim $HOME/.config/nix-darwin/modules/home-manager/packages/zsh.nix";
      pipes = "pipes-rs";
      rd = "rm -rf .DS_Store";
      rebuild = "sudo nix flake update && sudo darwin-rebuild switch --flake .";
      n = "nvim";
      sn = "sudo -Es nvim";
      tree = "tree -a -C -I '.git' -I 'node_modules'";
    };
    initContent = lib.mkMerge [
      (lib.mkBefore ''
        # initExtraFirst
        git_develop_branch () {
          command git rev-parse --git-dir &>/dev/null || return
          local branch
          for branch in dev devel development; do
            if command git show-ref -q --verify refs/heads/$branch; then
              echo $branch
              return
            fi
          done
          echo develop
        }

        git_main_branch () {
          command git rev-parse --git-dir &>/dev/null || return
          local ref
          for ref in refs/{heads,remotes/{origin,upstream}}/{main,trunk,mainline,default}; do
            if command git show-ref -q --verify $ref; then
              echo ''${ref:t}
              return
            fi
          done
          echo master
        }

        zsh-backward-kill-word () {
          local WORDCHARS=""
          zle -f kill
          zle backward-kill-word
        }

        export ANDROID_HOME=$HOME/Library/Android/sdk
        export BUN_INSTALL="$HOME/.bun"

        export PATH="$BUN_INSTALL/bin:$PATH"
        export PATH="/Library/Frameworks/Python.framework/Versions/3.13/bin:$PATH"
        export PATH=$PATH:$ANDROID_HOME/emulator
        export PATH=$PATH:$ANDROID_HOME/platform-tools
        export PATH=$PATH:$HOME/go/bin

        export NVM_DIR="$HOME/.config/nvm"

        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
        [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
      '')

      (lib.mkOrder 550 ''
        # initExtraBeforeCompInit
        autoload -Uz up-line-or-beginning-search
        autoload -Uz down-line-or-beginning-search
      '')

      ''
        # initExtra
        setopt always_to_end
        setopt append_history
        setopt auto_list
        setopt auto_menu
        setopt auto_pushd
        setopt complete_in_word
        setopt hist_find_no_dups
        setopt hist_reduce_blanks
        setopt hist_save_no_dups
        setopt inc_append_history
        setopt menu_complete

        _comp_options+=(globdots)

        zle -N up-line-or-beginning-search
        zle -N down-line-or-beginning-search
        zle -N zsh-backward-kill-word

        zstyle ':completion:*:*:*:*:*' menu select
        zstyle ':completion:*' special-dirs true
        zstyle ':completion:*' list-colors ""
        zstyle ':completion::complete:*' gain-privileges 1

        if [[ "$CASE_SENSITIVE" = true ]]; then
          zstyle ':completion:*' matcher-list 'r:|=*' 'l:|=* r:|=*'
        else
          if [[ "$HYPHEN_INSENSITIVE" = true ]]; then
            zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]-_}={[:upper:][:lower:]_-}' 'r:|=*' 'l:|=* r:|=*'
          else
            zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|=*' 'l:|=* r:|=*'
          fi
        fi

        unset CASE_SENSITIVE HYPHEN_INSENSITIVE

        bindkey -e
        bindkey "^[[3~" delete-char
        bindkey "^[[5~" beginning-of-buffer-or-history
        bindkey "^[[6~" end-of-buffer-or-history
        bindkey "^[[H" beginning-of-line
        bindkey "^[[F" end-of-line
        bindkey "^[[1;5C" forward-word
        bindkey "^[[1;5D" backward-word
        bindkey "^[[A" up-line-or-beginning-search
        bindkey "^[OA" up-line-or-beginning-search
        bindkey "^[[B" down-line-or-beginning-search
        bindkey "^[OB" down-line-or-beginning-search
        bindkey '^w' zsh-backward-kill-word

        eval "$(/opt/homebrew/bin/brew shellenv)"
        eval "$(op completion zsh)"; compdef _op op
      ''
    ];
  };
}
