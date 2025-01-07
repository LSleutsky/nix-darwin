{ config, lib, pkgs, ... }:

{
  programs.ghostty = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    installBatSyntax = true;
    installVimSyntax = true;
    settings = {
      font-family = "BerkeleyMono Nerd Font";
      theme = "catppuccin-mocha";
      font-size = 10;
    };
  };
}