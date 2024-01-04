{ config, lib, pkgs, ... }:

{
  programs.ripgrep = {
    enable = true;
    package = pkgs.ripgrep-all;
    arguments = [
      "--hidden"
      "--smart-case"
      "--glob=!.git/*"
      "--glob=!{**/node_modules/**, node_modules/**, node_modules}"
      "--glob=!package-lock.json"
    ];
  };
}
