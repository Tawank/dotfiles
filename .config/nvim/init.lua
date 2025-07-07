vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

vim.api.nvim_create_user_command("Bdelete", function(opts)
  require("bufdelete")._buf_kill_cmd(opts, false)
end, {
  bang = true,
  bar = true,
  count = true,
  addr = "buffers",
  nargs = "*",
  complete = "buffer",
})

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "autocmds"

local function open_nvim_tree(data)
  -- buffer is a real file on the disk
  local real_file = vim.fn.filereadable(data.file) == 1

  if real_file then
    return
  end

  -- open the tree
  require('neo-tree.command').execute({})
end

vim.schedule(function()
  require "mappings"
end)

vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
