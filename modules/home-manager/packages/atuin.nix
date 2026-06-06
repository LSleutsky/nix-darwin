{ config, lib, pkgs, ... }:

{
  programs.atuin = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
  };
}
