{
  xdg.configFile."lvim/config.lua" = {
    enable = true;
    text = ''
      --- ########################################################################################
      --- ##################################### GENERAL ##########################################
      --- ########################################################################################
      vim.opt.autoindent = true
      vim.opt.copyindent = true
      vim.opt.linebreak = true
      vim.opt.preserveindent = true
      vim.opt.relativenumber = true
      vim.opt.shiftwidth = 2
      vim.opt.smartindent = true
      vim.opt.smarttab = true
      vim.opt.softtabstop = 2
      vim.opt.tabstop = 2
      vim.opt.showtabline = 2
      vim.opt.wrap = true
      vim.opt.termguicolors = true

      --- ########################################################################################
      --- ####################################### LVIM ###########################################
      --- ########################################################################################
      lvim.colorscheme = "catppuccin-mocha"
      lvim.log.level = "info"
      lvim.format_on_save = {
        enabled = true,
        pattern = "*.lua",
        timeout = 1000,
      }

      --- ########################################################################################
      --- #################################### KEYMAPPINGS #######################################
      --- ########################################################################################
      lvim.leader = "space"

      -- normal mode
      lvim.keys.normal_mode["<C-s>"] = ":w <cr>"
      lvim.keys.normal_mode["<C-S-s>"] = ":wa <cr>"
      lvim.keys.normal_mode["<tab>"] = "<cmd> BufferLineCycleNext <cr>"
      lvim.keys.normal_mode["<S-tab>"] = "<cmd> BufferLineCyclePrev <cr>"
      lvim.keys.normal_mode["`"] = "<cmd> BufferLineMoveNext <cr>"
      lvim.keys.normal_mode["<C-`>"] = "<cmd> BufferLineMovePrev <cr>"
      lvim.keys.normal_mode["<S-q>"] = "<cmd> BufferKill <cr>"
      lvim.keys.normal_mode["<leader>xb"] = "<cmd> CBlbox <cr>"
      lvim.keys.normal_mode["<leader>xl"] = "<cmd> CBline <cr>"
      lvim.keys.normal_mode["-"] = "<cmd> qa <cr>"
      lvim.keys.normal_mode["x"] = '"_x'
      lvim.keys.normal_mode["X"] = '"_X'
      lvim.keys.normal_mode["<esc>"] = "<cmd> noh <cr>"
      lvim.keys.normal_mode["<C-a>"] = "gg0VG"
      lvim.keys.normal_mode["<C-c>"] = "<cmd> %y+ <cr>"
      lvim.keys.normal_mode["<C-x>"] = "<C-w>c"
      lvim.keys.normal_mode["<leader>t"] = "<cmd> TroubleToggle <cr>"
      lvim.keys.normal_mode["<S-Up>"] = "<cmd> m-2 <cr>"
      lvim.keys.normal_mode["<S-Down>"] = "<cmd> m+ <cr>"

      -- insert mode
      lvim.keys.insert_mode["<C-s>"] = "<esc> :w <cr>"
      lvim.keys.insert_mode["<C-S-s>"] = "<esc> :wa <cr>"
      lvim.keys.insert_mode["<C-h>"] = "<Left>"
      lvim.keys.insert_mode["<C-j>"] = "<Down>"
      lvim.keys.insert_mode["<C-k>"] = "<Up>"
      lvim.keys.insert_mode["<C-l>"] = "<Right>"
      lvim.keys.insert_mode["<C-a>"] = "<Home>"
      lvim.keys.insert_mode["<C-b>"] = "<esc>^i"
      lvim.keys.insert_mode["<C-e>"] = "<End>"
      lvim.keys.insert_mode["<S-Up>"] = "<Esc> <cmd> m-2 <cr>"
      lvim.keys.insert_mode["<S-Down>"] = "<Esc> <cmd> m+ <cr>"

      -- visual mode
      lvim.keys.visual_mode["x"] = '"_x'
      lvim.keys.visual_mode["X"] = '"_X'

      -- which key
      lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects <cr>", "Projects" }
      lvim.builtin.which_key.mappings["sw"] = { "<cmd>Telescope grep_string <cr>", "Word under cursor" }
      lvim.builtin.which_key.mappings["gy"] = {
        '<cmd>lua require("gitlinker").get_buf_range_url("n") <cr>',
        "Git path permalink",
      }

      --- ########################################################################################
      --- ##################################### BUILTINS #########################################
      --- ########################################################################################
      -- alpha
      lvim.builtin.alpha.active = true
      lvim.builtin.alpha.mode = "dashboard"

      -- git
      lvim.builtin.gitsigns.opts.current_line_blame = true
      lvim.builtin.gitsigns.opts.current_line_blame_formatter =
      "<author> ∙ <author_time:%B %d, %Y at %I:%M%p> ∙ <summary>"

      -- lualine
      lvim.builtin.lualine.style = "default"
      lvim.builtin.lualine.sections.lualine_c = {
        {
          "diagnostics",
          sources = { "nvim_diagnostic" },
          symbols = { error = " ", warn = " ", info = " ", hint = " " },
        },
        "diff",
      }
      lvim.builtin.lualine.sections.lualine_x = { "filetype" }

      -- nvimtree
      lvim.builtin.nvimtree.setup.renderer.icons.show.git = false
      lvim.builtin.nvimtree.setup.view.side = "left"

      -- terminal
      lvim.builtin.terminal.active = true

      -- treesitter
      lvim.builtin.treesitter.auto_install = true
      lvim.builtin.treesitter.ensure_installed = {
        "bash",
        "comment",
        "css",
        "diff",
        "dockerfile",
        "dot",
        "fish",
        "git_rebase",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "graphql",
        "help",
        "hjson",
        "html",
        "http",
        "javascript",
        "jsdoc",
        "json",
        "json5",
        "jsonc",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "mermaid",
        "php",
        "pug",
        "python",
        "query",
        "regex",
        "ruby",
        "rust",
        "scss",
        "svelte",
        "todotxt",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "yaml",
      }
      lvim.builtin.treesitter.ignore_install = {
        "help",
      }

      --- ########################################################################################
      --- ######################################### LSP ##########################################
      --- ########################################################################################
      -- formatters
      require("lvim.lsp.null-ls.formatters").setup({
        {
          command = "stylua",
          filetypes = { "lua" },
        },
        {
          command = "prettierd",
          extra_args = { "--print-width", "100" },
          filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        },
        {
          command = "eslint_d",
          filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        },
      })

      -- linters
      require("lvim.lsp.null-ls.linters").setup({
        {
          command = "eslint_d",
          filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        },
      })

      -- code actions
      require("lvim.lsp.null-ls.code_actions").setup({
        {
          command = "eslint_d",
          filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        },
      })

      --- ########################################################################################
      --- ###################################### PLUGINS #########################################
      --- ########################################################################################
      lvim.plugins = {
        -- general
        {
          "gorbit99/codewindow.nvim",
          config = function()
            require("codewindow").setup({
              active_in_terminals = false,
              auto_enable = {
                "javascript",
                "javascriptreact",
                "json",
                "lua",
                "yaml",
                "yml",
              },
              exclude_filetypes = {
                "NvimTree",
                "NvimTree_1",
                "Trouble",
                "alpha",
              },
              max_minimap_height = nil,
              max_lines = nil,
              minimap_width = 15,
              use_lsp = true,
              use_treesitter = true,
              use_git = true,
              width_multiplier = 4,
              z_index = 1,
              show_cursor = false,
              window_border = "none",
            })
          end,
        },
        {
          "karb94/neoscroll.nvim",
          config = function()
            require("neoscroll").setup({
              mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "zt", "zz", "zb" },
              hide_cursor = false,
              performance_mode = false,
              respect_scrolloff = false,
              stop_eof = true,
            })
          end,
        },

        -- utility
        {
          "folke/trouble.nvim",
          config = function()
            require("trouble").setup()
          end,
        },
        {
          "gbprod/stay-in-place.nvim",
          config = function()
            require("stay-in-place").setup()
          end,
        },
        {
          "kylechui/nvim-surround",
          event = "InsertEnter",
          config = function()
            require("nvim-surround").setup()
          end,
        },
        {
          "s1n7ax/nvim-search-and-replace",
          config = function()
            require("nvim-search-and-replace").setup({
              ignore = {
                "**/node_modules/**",
                "**/.git/**",
                "**/.github/**",
                "**/.gitignore",
                "build/**",
                "dist/**",
              },
            })
          end,
        },
        {
          "windwp/nvim-ts-autotag",
          config = function()
            require("nvim-treesitter.configs").setup({
              autotag = {
                enable = true,
                filetypes = {
                  "html",
                  "javascript",
                  "javascriptreact",
                  "typescript",
                  "typescriptreact",
                  "jsx",
                  "markdown",
                },
              },
            })
          end,
        },

        -- ui
        { "mg979/vim-visual-multi", after = "nvim-treesitter" },
        { "catppuccin/nvim",        name = "catppuccin" },
        {
          "norcalli/nvim-colorizer.lua",
          config = function()
            require("colorizer").setup({ "*" }, {
              RGB = true,
              RRGGBB = true,
              RRGGBBAA = true,
              rgb_fn = true,
              hsl_fn = true,
              css = true,
              css_fn = true,
            })
          end,
        },

        -- comments
        {
          "folke/todo-comments.nvim",
          after = "plenary.nvim",
          config = function()
            require("todo-comments").setup()
          end,
        },
        {
          "LudoPinelli/comment-box.nvim",
          cmd = { "CBlbox", "CBline" },
          config = function()
            require("comment-box").setup({
              doc_width = 90,
              box_width = 90,
              line_width = 90,
            })
          end,
        },

        -- git
        {
          "akinsho/git-conflict.nvim",
          config = function()
            require("git-conflict").setup()
          end,
        },
        {
          "ruifm/gitlinker.nvim",
          after = "plenary.nvim",
          config = function()
            require("gitlinker").setup({
              opts = {
                add_current_line_on_normal_mode = true,
                print_url = true,
              },
              mappings = "<leader>gy",
            })
          end,
        },
        {
          "sindrets/diffview.nvim",
          after = "plenary.nvim",
          config = function()
            require("diffview").setup({
              enhanced_diff_hl = true,
              git_cmd = { "git" },
              use_icons = true,
              icons = {
                folder_closed = "",
                folder_open = "",
              },
              signs = {
                fold_closed = "",
                fold_open = "",
                done = "✓",
              },
              file_panel = {
                listing_style = "tree",
              },
            })
          end,
        },
      }

      --- ########################################################################################
      --- #################################### AUTOCOMMANDS ######################################
      --- ########################################################################################
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "zsh", "*.sh", "*bash*" },
        callback = function()
          require("nvim-treesitter.highlight").attach(0, "bash")
        end,
      })

      vim.api.nvim_create_autocmd("VimResized", {
        pattern = "*",
        command = "tabdo wincmd =",
      })

      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = { ".conf", "config" },
        command = "setf dosini",
      })

      vim.api.nvim_create_autocmd("TextYankPost", {
        callback = function()
          vim.highlight.on_yank({ higroup = 'IncSearch', timeout = 250 })
        end
      })
    '';
  };
}