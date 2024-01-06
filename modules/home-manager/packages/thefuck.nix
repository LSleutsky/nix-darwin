{ config, lib, pkgs, ... }:

{
  programs.thefuck = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    enableInstantMode = true;
  };
}
