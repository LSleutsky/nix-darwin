{ config, lib, pkgs, ... }:

{
  programs.pay-respects = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;
    settings = {
      options = [
        "f"
      ];
    };
  };
}
