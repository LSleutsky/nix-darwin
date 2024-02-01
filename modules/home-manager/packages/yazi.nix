{ config, lib, inputs, pkgs, ... }:

{
  programs.yazi = {
    enable = true;
    package = inputs.yazi.packages.${pkgs.system}.yazi;
    enableBashIntegration = true;
    enableZshIntegration = true;
    settings = {
      manager = {
        linemode = "size";
        show_hidden = true;
        sort_dir_first = true;
        sort_sensitive = true;
        show_symlink = true;
      };
    };
  };
}
