{ config, lib, pkgs, ... }:

{
  programs.nixvim = {
    enable = true;
    enableMan = true;
    viAlias = true;
		vimAlias = true;
    withNodeJs = true;
    globals.mapleader = " ";
    colorschemes.oxocarbon.enable = true;
    opts = {
			incsearch = true;
      number = true;
      numberwidth = 2;
      relativenumber = true;
      ignorecase = true;
      smartcase = true;
      expandtab = true;
      autoindent = true;
      preserveindent = true;
			smartindent = true;
      cursorline = true;
      shiftwidth = 2;
      softtabstop = 2;
      tabstop = 2;
      clipboard = "unnamedplus";
      signcolumn = "yes";
      mouse = "a";
      shortmess = "sI";
      termguicolors = true;
      swapfile = false;
      undofile = true;
      whichwrap = "<>[]hl";
    };
    autoCmd = [
      {
        event = "FileType";
        pattern = "qf";
        callback = {
          __raw = ''
            function()
              vim.opt_local.buflisted = false
            end
          '';
        };
      }
      {
        event = "InsertLeave";
        callback = {
          __raw = ''
            function()
              if
                require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
                and not require("luasnip").session.jump_active
              then
                require("luasnip").unlink_current()
              end
            end
          '';
        };
      }
      {
        event = "TextYankPost";
        pattern = "*";
        callback = {
          __raw = ''
            function()
              vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 250 })
            end
          '';
        };
      }
      {
        event = "VimResized";
        pattern = "*";
        command = "tabdo wincmd =";
      }
    ];
    plugins = {
      lualine.enable = true;
    };
  };
}