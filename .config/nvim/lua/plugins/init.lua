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
    -- event = 'BufWritePre', -- uncomment for format on save
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
        },
        event_handlers = {
          {
            event = "neo_tree_popup_input_ready",
            handler = function()
              vim.cmd "stopinsert"
            end,
          },
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
          -- augend.constant.new{ elements = { "===", "!==", "<", ">", "<=", ">=" }, word = true },
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
    "nvim-treesitter/nvim-treesitter-context",
    lazy = false,
    config = function()
      require("treesitter-context").setup {
        enable = true,
        mode = 'topline'
      }
    end,

  },

}
