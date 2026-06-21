{ config, lib, pkgs, ... }:

{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "tokyo-night"
      "vscode-icons"
      "git-firefly"
      "html"
      "scss"
      "graphql"
      "dockerfile"
      "docker-compose"
      "env"
      "toml"
      "sql"
      "nix"
    ];
    userSettings = {
      theme = "Tokyo Night";
      icon_theme = "VSCode Icons for Zed (Dark)";
    };
  };
}