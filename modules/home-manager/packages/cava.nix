{ config, lib, pkgs, ... }:

{
  programs.cava = {
    enable = true;
    settings = {
      general = {
        framerate = 60;
      };
      input = {
        method = "coreaudio";
        source = "tap";
      };
    };
  };
}
