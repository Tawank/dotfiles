-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "catppuccin",

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

M.term = {
  float = {
    row = 0.05, -- 0.3
    col = 0.1, -- 0.25
    width = 0.8, -- 0.5
    height = 0.8 -- 0.4
  }
}

M.nvdash = { load_on_startup = true }
M.ui = {
  tabufline = {
    lazyload = false
  }
}

return M
