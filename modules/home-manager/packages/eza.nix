{ config, lib, pkgs, ... }:

{
  programs.eza = {
    enable = true;
    git = true;
    icons = "auto";
    extraOptions = [
      "--all"
      "--binary"
      "--group-directories-first"
      "--long"
    ];
  };
}
