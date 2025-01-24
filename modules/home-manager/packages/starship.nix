{ config, lib, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    settings = {
      format = "$directory$git_branch$git_status$docker_context$character";
      right_format = "$nodejs";
      add_newline = true;
      command_timeout = 2500;
      character = {
        success_symbol = "[](#a6e3a1 bold)";
        error_symbol = "[](#f38ba8)";
        vicmd_symbol = "[](#f9e2af)";
      };
      directory = {
        format = "[]($style)[ ](bg:#181825 fg:#b4befe)[$path](bg:#181825 fg:#cdd6f4 bold)[ ]($style)";
        style = "bg:none fg:#181825";
        truncation_length = 3;
        truncate_to_repo=false;
      };
      docker_context = {
        symbol = "  ";
        style = "blue bold";
        format = "via [$symbol$context]($style) ";
        only_with_files = true;
        disabled = false;
        detect_extensions = [];
        detect_files = [
          "docker-compose.yml"
          "docker-compose.yaml"
          "Dockerfile"
        ];
        detect_folders = [ "docker" ];
      };
      git_branch = {
        format = "[]($style)[[ ](bg:#181825 fg:#74c7ec bold)$branch](bg:#181825 fg:#74c7ec)[ ]($style)";
        style = "bg:none fg:#181825";
      };
      git_status = {
        format = "([$all_status$ahead_behind]($style) )";
        style = "bg:none fg:#f38ba8";
        stashed = "📦";
        ahead = "⇡";
        behind = "⇣";
        up_to_date = "";
        diverged = "⇕";
        conflicted = "=";
        deleted = "✘";
        renamed = "»";
        modified = "!";
        staged = "+";
        untracked = "?";
        ignore_submodules = false;
        disabled = false;
      };
      line_break = {
        disabled = false;
      };
      nodejs = {
        format = " [$symbol($version )]($style)";
        symbol = " ";
        style = "bold green";
        disabled = false;
        not_capable_style = "bold red";
        detect_extensions = [
          "js"
          "jsx"
          "mjs"
          "cjs"
          "ts"
          "tsx"
          "mts"
          "cts"
        ];
        detect_files = [
          "package.json"
          ".node-version"
          ".nvmrc"
          ".yarnrc"
          ".npmrc"
        ];
        detect_folders = [
          ".nvm"
          "js"
          "node_modules"
        ];
      };
    };
  };
}
