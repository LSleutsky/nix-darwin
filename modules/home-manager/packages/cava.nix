{ config, lib, pkgs, ... }:

programs.cava = {
  enable = true;
  settings = {
    input = {
      method = "portaudio";
      source = "BlackHole 2ch";
    };
  };
};
