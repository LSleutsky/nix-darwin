{ config, lib, pkgs, ... }:

{
  programs.eza = {
    enable = true;
    git = true;
    icons = true;
    extraOptions = [
      "--all"
      "--binary"
      "--group-directories-first"
      "--long"
    ];
  };
}
