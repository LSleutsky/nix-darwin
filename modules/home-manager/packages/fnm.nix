{ config, lib, pkgs, ... }:

{
  programs.fnm = {
    enable = true;
    enableZshIntegration = true;
    settings.version-file-strategy = "recursive";
  };
}