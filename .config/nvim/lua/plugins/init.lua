vim.g.rainbow_delimiters = {
  highlight = {
    'RainbowDelimiterRed',
    'RainbowDelimiterYellow',
    'RainbowDelimiterBlue',
    'RainbowDelimiterOrange',
    'RainbowDelimiterGreen',
    'RainbowDelimiterViolet',
    'RainbowDelimiterCyan',
  },
}

return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  { "famiu/bufdelete.nvim", keys = { { "<leader>qr", "<Cmd>Bdelete<CR>", desc = "buffer delete" } } },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup {
        current_line_blame = true,
      }
    end,
  },

  { "tpope/vim-fugitive" },

  {
    "nvim-tree/nvim-tree.lua",
    enabled = false,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- diffview
  {
    "sindrets/diffview.nvim",
    config = function()
      require("diffview").setup {}
    end,
  },

  { "nvzone/volt", lazy = true },
  { "nvzone/menu", lazy = true },

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      -- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    lazy = false, -- neo-tree will lazily load itself,
    config = function()
      require("neo-tree").setup {
        -- add_blank_line_at_top = true,
        -- close_if_last_window = true,
        sources = {
          "filesystem",
          "document_symbols",
          "git_status",
        },
        source_selector = {
          position = "left",
          width = 40,
          winbar = true, -- toggle to show selector on winbar
        },
        window = {
          insert_as = "child",
          mappings = {
            ["<space>"] = {
              "toggle_node",
              nowait = false, -- disable `nowait` if you have existing combos starting with this char that you want to use
            },
            ["<2-LeftMouse>"] = "open",
            ["<cr>"] = "open",
            ["<esc>"] = "cancel", -- close preview or floating neo-tree window
            ["P"] = {
              "toggle_preview",
              config = {
                use_float = true,
                use_snacks_image = true,
                use_image_nvim = true,
              },
            },
            -- Read `# Preview Mode` for more information
            ["l"] = "focus_preview",
            ["s"] = "git_add_file",
            ["S"] = "git_unstage_file",
            ["t"] = "open_tabnew",
            -- ["<cr>"] = "open_drop",
            -- ["t"] = "open_tab_drop",
            ["w"] = "open_with_window_picker",
            --["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
            ["C"] = "close_node",
            -- ['C'] = 'close_all_subnodes',
            ["z"] = "close_all_nodes",
            --["Z"] = "expand_all_nodes",
            --["Z"] = "expand_all_subnodes",
            ["a"] = {
              "add",
              -- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
              -- some commands may take optional config options, see `:h neo-tree-mappings` for details
              config = {
                show_path = "none", -- "none", "relative", "absolute"
              },
            },
            ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
            ["d"] = "delete",
            ["r"] = "rename",
            ["b"] = "rename_basename",
            ["y"] = "copy_to_clipboard",
            ["x"] = "cut_to_clipboard",
            ["p"] = "paste_from_clipboard",
            ["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
            -- ["c"] = {
            --  "copy",
            --  config = {
            --    show_path = "none" -- "none", "relative", "absolute"
            --  }
            --}
            ["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
            ["q"] = "close_window",
            ["R"] = "refresh",
            ["?"] = "show_help",
            ["<"] = "prev_source",
            [">"] = "next_source",
            ["i"] = "show_file_details",
            -- ["i"] = {
            --   "show_file_details",
            --   -- format strings of the timestamps shown for date created and last modified (see `:h os.date()`)
            --   -- both options accept a string or a function that takes in the date in seconds and returns a string to display
            --   -- config = {
            --   --   created_format = "%Y-%m-%d %I:%M %p",
            --   --   modified_format = "relative", -- equivalent to the line below
            --   --   modified_format = function(seconds) return require('neo-tree.utils').relative_date(seconds) end
            --   -- }
            -- },
          },
        },
        git_status = {
          window = {
            position = "float",
            mappings = {
              ["A"] = "git_add_all",
              ["a"] = "git_add_file",
              ["U"] = "git_unstage_all",
              ["u"] = "git_unstage_file",
              ["gu"] = "git_unstage_file",
              ["gU"] = "git_undo_last_commit",
              ["ga"] = "git_add_file",
              ["gr"] = "git_revert_file",
              ["gc"] = "git_commit",
              ["gp"] = "git_push",
              ["gg"] = "git_commit_and_push",
              ["o"] = {
                "show_help",
                nowait = false,
                config = { title = "Order by", prefix_key = "o" },
              },
              ["oc"] = { "order_by_created", nowait = false },
              ["od"] = { "order_by_diagnostics", nowait = false },
              ["om"] = { "order_by_modified", nowait = false },
              ["on"] = { "order_by_name", nowait = false },
              ["os"] = { "order_by_size", nowait = false },
              ["ot"] = { "order_by_type", nowait = false },
            },
          },
        },
        default_component_configs = {
        -- event_handlers = {
        --   {
        --     event = "neo_tree_popup_input_ready",
        --     handler = function()
        --       vim.cmd "stopinsert"
        --     end,
        --   },
        },
      }
    end,
  },

  {
    "akinsho/bufferline.nvim",
    event = "UIEnter",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      local bufferline = require "bufferline"
      bufferline.setup {
        options = {
          style_preset = { bufferline.style_preset.minimal },
          mode = "buffers",
          sort_by = "insert_after_current",
          move_wraps_at_ends = true,
          -- right_mouse_command = "vert sbuffer %d",
          middle_mouse_command = ":Bdelete %d",
          show_close_icon = true,
          close_command = ":Bdelete %d",
          show_buffer_close_icons = true,
          always_show_bufferline = true,
          indicator = { style = "underline" },
          -- diagnostics = "nvim_lsp",
          -- diagnostics_indicator = function(count, level)
          --   level = level:match "warn" and "warn" or level
          --   return (icons[level] or "?") .. " " .. count
          -- end,
          -- diagnostics_update_in_insert = false,
          -- hover = { enabled = true, reveal = { "close" } },
          offsets = {
            {
              text = "EXPLORER",
              filetype = "neo-tree",
              highlight = "PanelHeading",
              text_align = "left",
              separator = true,
            },
          },
        },
      }
    end,
  },

  {
    'HiPhish/rainbow-delimiters.nvim',
    event = 'VeryLazy',
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    -- event = "UIEnter",
    opts = {
      exclude = {
        -- stylua: ignore
        filetypes = {
          'dbout', 'neo-tree-popup', 'log', 'gitcommit',
          'txt', 'help', 'NvimTree', 'git', 'flutterToolsOutline',
          'undotree', 'markdown', 'norg', 'org', 'orgagenda',
        },
      },
      indent = {
        char = "▏", -- │ ▏┆ ┊ 
        tab_char = "▏",
      },
      scope = {
        char = "▏",
      },
    },
    config = function()
      local highlight = {
          "RainbowRed",
          "RainbowYellow",
          "RainbowBlue",
          "RainbowOrange",
          "RainbowGreen",
          "RainbowViolet",
          "RainbowCyan",
      }
      local hooks = require "ibl.hooks"
      -- create the highlight groups in the highlight setup hook, so they are reset
      -- every time the colorscheme changes
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
          vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
          vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
          vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
          vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
          vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
          vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
          vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
      end)

      vim.g.rainbow_delimiters = { highlight = highlight }
      require("ibl").setup {
        exclude = {
          -- stylua: ignore
          filetypes = {
            'dbout', 'neo-tree-popup', 'log', 'gitcommit',
            'txt', 'help', 'NvimTree', 'git', 'flutterToolsOutline',
            'undotree', 'markdown', 'norg', 'org', 'orgagenda',
          },
        },
        indent = {
          char = "▏", -- │ ▏┆ ┊ 
          tab_char = "▏",
        },
        scope = {
          char = "▏",
          highlight = highlight,
          exclude = {
            language = {},
            node_type = {
              ["*"] = {
                "source_file",
                "program",
              },
              lua = {},
              python = {
                "module",
              },
            }
          }
        }
      }

      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "json",
        "typescript",
        "tsx",
      },
    },
  },

  {
    "monaqa/dial.nvim",
    -- lazy = false,
    config = function ()
      local augend = require("dial.augend")
        require("dial.config").augends:register_group{
        default = {
          augend.integer.alias.decimal_int,
          augend.integer.alias.hex,
          augend.date.alias["%Y-%m-%d"],
          augend.constant.alias.bool,
          augend.constant.new{ elements = { "let", "const" } },
          augend.constant.new{ elements = { "&&", "||" }, word = false },
          augend.constant.new{ elements = { "==", "!=" }, word = false },
          augend.constant.new{ elements = { "===", "!==" }, word = false },
          augend.constant.new{ elements = { "<=", ">=" }, word = false },
          augend.constant.new{ elements = { "<", ">" }, word = false },
        },
      }
    end
  },

  {
    'jake-stewart/multicursor.nvim',
    event = 'VeryLazy',
    config = function()
      local mc = require('multicursor-nvim')
      mc.setup()
      local map = vim.keymap.set
      map({ 'n', 'v' }, '<C-r>', function() mc.matchAddCursor(1) end)
      map({ 'n', 'v' }, '<C-f>', function() mc.matchSkipCursor(1) end)
      map('n', '<esc>', function()
        if mc.cursorsEnabled() then mc.clearCursors() end
      end)
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = false,
    config = function()
      require 'nvim-treesitter.configs'.setup {
        textobjects = {
          select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
              -- You can use the capture groups defined in textobjects.scm
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
            }
          },

          swap = {
            enable = true,
            swap_next = {
              ["<leader>a"] = "@parameter.inner",
            },
            swap_previous = {
              ["<leader>A"] = "@parameter.inner",
            },
          },
        }
      }
    end,
  },

  {
    "kylechui/nvim-surround",
    version = "^3.0.0", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-context",
    lazy = false,
    config = function()
      require("treesitter-context").setup {
        enable = true,
        mode = 'topline',
        multiline_threshold = 10,
      }
    end,

  },

}
