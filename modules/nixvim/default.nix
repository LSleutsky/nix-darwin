{ config, lib, pkgs, ... }: 

{
  programs.nixvim = {
    enable = true;
		enableMan = true;
		vimAlias = true;
    globals.mapleader = " ";
    colorschemes.catppuccin = {
      enable = true;
      settings = {
        background.dark = "mocha";
        flavour = "mocha";
        integrations = {
          gitsigns = true;
          native_lsp.enabled = true;
          navic.enabled = true;
          nvimtree = true;
          telescope.enabled = true;
          treesitter = true;
          treesitter_context = true;
          ts_rainbow2 = true;
          illuminate = {
            enabled = true;
            lsp = true;
          };
          indent_blankline = {
            enabled = true;
            colored_indent_levels = true;
          };
        };
        styles = {
          booleans = ["bold" "italic"];
          conditionals = ["bold"];
          functions = ["bold"];
          keywords = ["italic"];
          loops = ["bold"];
          operators = ["bold"];
          properties = ["italic"];
        };
        term_colors = true;
      };
    };
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
    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };
		keymaps = [
			{
        mode = "n";
				key = "<esc>";
				action = ":noh<CR>";
				options = {
					silent = true;
				};
			}
			{
				mode = "n";
				key = "-";
				action = ":qa<CR>";
        options = {
          desc = "Exit";
        };
			}
      {
        mode = "n";
        key = ";";
        action = ":";
        options = {
          desc = "Enter command mode";
          nowait = true;
        };
      }
      {
        mode = "n";
        key = "<C-a>";
        action = "gg0VG";
        options = {
          desc = "Select all";
        };
      }
      {
        mode = "n";
        key = "<C-c>";
        action = ":%y+<CR>";
        options = {
          desc = "Copy all";
        };
      }
			{
				mode = "n";
				key = "<C-s>";
				action = ":w<CR>";
        options = {
          desc = "Save current buffer";
        };
			}
      {
        mode = "n";
        key = "<C-h>";
        action = "<C-w>h";
        options = {
          desc = "Window left";
        };
      }
      {
        mode = "n";
        key = "<C-l>";
        action = "<C-w>l";
        options = {
          desc = "Window right";
        };
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<C-w>j";
        options = {
          desc = "Window down";
        };
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<C-w>k";
        options = {
          desc = "Window up";
        };
      }
      {
        mode = "n";
        key = "<C-n>";
        action = ":NvimTreeToggle<CR>";
        options = {
          desc = "Toggle file explorer";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<C-x>";
        action = "<C-w>c";
        options = {
          desc = "Close window";
        };
      }
      {
        mode = "n";
        key = "<S-down>";
        action = ":m+<CR>==";
        options = {
          desc = "Move selected text down";
        };
      }
      {
        mode = "n";
        key = "<S-up>";
        action = ":m-2<CR>==";
        options = {
          desc = "Move selected text up";
        };
      }
      {
        mode = "n";
        key = "<leader>b";
        action = ":enew<CR>";
        options = {
          desc = "new buffer";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "q";
        action = ":BufferClose<CR>";
        options = {
          desc = "Close current buffer";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<tab>";
        action = ":BufferNext<CR>";
        options = {
          desc = "Go to next buffer";
          silent = true;
        };
      }
      {
        mode = "n";
        key = "<S-tab>";
        action = ":BufferPrevious<CR>";
        options = {
          desc = "Go to previous buffer";
          silent = true;
        };
      }
      {
        mode = ["n" "v"];
        key = "x";
        action = "\"_x";
        options = {
          desc = "Don't yank deleted char";
        };
      }
      {
        mode = ["n" "v"];
        key = "X";
        action = "\"_X";
        options = {
          desc = "Don't yank deleted char";
        };
      }
			{
				mode = "v";
				key = ">gv";
				action = ">";
        options = {
          desc = "Move line 2 spaces forward";
        };
			}
			{
				mode = "v";
				key = "<gv";
				action = "<";
        options = {
          desc = "Move line 2 spaces backward";
        };
			}
      {
        mode = "i";
        key = "<C-b>";
        action = "<esc>^i";
        options = {
          desc = "Go to beginning of line";
        };
      }
      {
        mode = "i";
        key = "<C-e>";
        action = "<End>";
        options = {
          desc = "Go to end of line";
        };
      }
      {
        mode = "i";
        key = "<C-h>";
        action = "<Left>";
        options = {
          desc = "Move left";
        };
      }
      {
        mode = "i";
        key = "<C-l>";
        action = "<Right>";
        options = {
          desc = "Move right";
        };
      }
      {
        mode = "i";
        key = "<C-j>";
        action = "<Down>";
        options = {
          desc = "Move down";
        };
      }
      {
        mode = "i";
        key = "<C-k>";
        action = "<Up>";
        options = {
          desc = "Move up";
        };
      }
			{
				mode = "i";
				key = "<C-s>";
				action = "<esc>:w<CR>";
        options = {
          desc = "Save current buffer";
        };
			}
		];
		plugins = {
      cmp-buffer.enable = true;
      cmp-fuzzy-buffer.enable = true;
      cmp-fuzzy-path.enable = true;
      cmp-git.enable = true;
      cmp_luasnip.enable = true;
      cmp-nvim-lsp.enable = true;
      cmp-nvim-lua.enable = true;
      cmp-path.enable = true;
      cmp-rg.enable = true;
      cmp-treesitter.enable = true;
      cmp-zsh.enable = true;
			cursorline.enable = true;
			illuminate.enable = true;
      inc-rename.enable = true;
			indent-blankline.enable = true;
			nix.enable = true;
			nix-develop.enable = true;
      trouble.enable = true;
      ts-autotag.enable = true;
      vim-surround.enable = true;
      web-devicons.enable = true;
      auto-session = {
        enable = true;
        settings = {
          enabled = true;
          auto_restore = true;
          auto_save = true;
          auto_restore_last_session = true;
        };
      };
      barbar = {
        enable = true;
        settings = {
          auto_hide = false;
          clickable = true;
          icons = {
            buffer_number = true;
            button = "x";
            current = {
              filetype.enable = true;
              pinned.filetype.enable = true;
            };
          };
        };
      };
      cmp = {
        enable = true;
        autoEnableSources = true;
      };
      comment = {
        enable = true;
        settings = {
          padding = true;
        };
      };
      diffview = {
        enable = true;
        useIcons = true;
      };
      gitlinker = {
        enable = true;
        actionCallback = "open_in_browser";
      };
      gitsigns = {
        enable = true;
        settings = {
          current_line_blame = true;
          signcolumn = true;
          trouble = true;
          current_line_blame_formatter = " <author>, <author_time:%Y-%m-%d> at <author_time:%I:%M %p> - <summary>";
          current_line_blame_formatter_nc = " <author>, <author_time>";
        };
      };
      lualine = {
        enable = true;
        settings = {
          options = {
            icons_enabled = true;
            theme = "catppuccin";
          };
          sections = {
            lualine_a = ["mode"];
            lualine_b = ["branch" "diff" "diagnostics"];
            lualine_c = [ "vim.fn.expand('%:~')" "navic" ];
            lualine_x = ["filetype"];
            lualine_y = ["progress"];
            lualine_z = ["location"];
          };
        };
      };
      luasnip = {
        enable = true;
        settings = {
          enable_autosnippets = true;
          store_selection_keys = "<Tab>";
        };
      };
      lsp = {
        enable = true;
        servers = {
          bashls.enable = true;
          cssls.enable = true;
          dockerls.enable = true;
          eslint.enable = true;
          html.enable = true;
          jsonls.enable = true;
          lua_ls.enable = true;
          nixd.enable = true;
          tailwindcss.enable = true;
          ts_ls.enable = true;
          yamlls.enable = true;
        };
      };
			navic = {
				enable = true;
        settings = {
          highlight = true;
          lsp.autoAttach = true;
        };
			};
      nvim-autopairs = {
        enable = true;
        settings = {
          enable_after_quote = true;
          enable_bracket_in_line = false;
          enable_bracket_in_quote = true;
          enable_move_right = true;
        };
      };
      nvim-tree = {
        enable = true;
        git = {
          enable = true;
          showOnDirs = true;
          showOnOpenDirs = true;
        };
        modified = {
          enable = true;
          showOnDirs = true;
          showOnOpenDirs = true;
        };
        renderer = {
          highlightGit = true;
          icons = {
            show = {
              file = true;
              folder = true;
              folderArrow = true;
              git = true;
              modified = true;
            };
          };
          indentMarkers = {
            enable = true;
            inlineArrows = true;
          };
        };
        view = {
          cursorline = true;
          side = "left";
          signcolumn = "yes";
        };
      };
      telescope = {
        enable = true;
      };
      treesitter = {
        enable = true;
        nixGrammars = true;
        nixvimInjections = true;
        settings = {
          incremental_selection.enable = true;
          indent.enable = true;
        };
      };
      treesitter-refactor = {
        enable = true;
        highlightDefinitions.enable = true;
        navigation = {
          enable = true;
          keymaps = {
            gotoDefinition = "gd";
          };
        };
      };
			vim-matchup = {
        settings = {
          enabled = 1;
          match_paren_enabled = 1;
          matchparen_deferred = 1;
          matchparen_deferred_hi_surround_always = 1;
          text_obj_enabled = 1;
          surround_enabled = 1;
        };
			};
      zk = {
        enable = true;
        settings = {
          lsp.auto_attach.enabled = true;
          picker = "telescope";
        };
      };
		};
    extraPlugins = with pkgs.vimPlugins; [
      friendly-snippets
    ];
    extraConfigLua = ''
      local cmp_status, cmp = pcall(require, "cmp")
      if not cmp_status then
        return
      end

      local luasnip_status, luasnip = pcall(require, "luasnip")
      if not luasnip_status then
        return
      end

      require("luasnip/loaders/from_vscode").lazy_load()

      vim.opt.completeopt = "menu,menuone,noselect"

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end
        },
        mapping = cmp.mapping.preset.insert({
          ["<S-tab>"] = cmp.mapping.select_prev_item(),
          ["<tab>"] = cmp.mapping.select_next_item(),
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<Esc>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = false })
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" }
        }),
      })
    '';
  };
}

