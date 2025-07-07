require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- ctrl+c, ctrl+v, ctrl+z
vim.cmd [[
" system clipboard
nmap <c-c> "+y
vmap <c-c> "+y
nmap <c-v> "+p
vmap <c-v> "+p
inoremap <c-v> <c-r>+
cnoremap <c-v> <c-r>+

nnoremap <C-Z> u
nnoremap <C-Y> <C-R>

inoremap <C-Z> <C-O>u
inoremap <C-Y> <C-O><C-R>
]]

-- Keyboard users
map("n", "<C-t>", function()
  require("menu").open "default"
end, {})

-- mouse users + nvimtree users!
map({ "n", "v" }, "<RightMouse>", function()
  require("menu.utils").delete_old_menus()

  vim.cmd.exec '"normal! \\<RightMouse>"'

  -- clicked buf
  local buf = vim.api.nvim_win_get_buf(vim.fn.getmousepos().winid)
  local options = vim.bo[buf].ft == "neo-tree" and "neo-tree" or "default"

  print(vim.bo[buf].ft)

  require("menu").open(options, { mouse = true })
end, {})

map({ "n", "i", "n"}, "<C-n>", "<cmd> Neotree toggle focus <cr>")

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map({ "n", "i" }, "<A-j>", "<cmd> m .+1 <cr>")
map({ "n", "i" }, "<A-k>", "<cmd> m .-2 <cr>")
-- map("v", "<A-j>", "<cmd> '<,'>m+2 <cr>gv=gv")
-- map("v", "<A-k>", "<cmd> '<,'>m-2 <cr>gv=gv")

map("n", "<Tab>", ">>")
map("n", "<S-Tab>", "<<")
map("v", "<Tab>", ">gv")
map("i", "<S-Tab>", "<gv")
map("v", "<S-Tab>", "<gv")

vim.keymap.set("n", "<C-a>", function()
    require("dial.map").manipulate("increment", "normal")
end)
vim.keymap.set("n", "<C-x>", function()
    require("dial.map").manipulate("decrement", "normal")
end)
vim.keymap.set("n", "g<C-a>", function()
    require("dial.map").manipulate("increment", "gnormal")
end)
vim.keymap.set("n", "g<C-x>", function()
    require("dial.map").manipulate("decrement", "gnormal")
end)
vim.keymap.set("v", "<C-a>", function()
    require("dial.map").manipulate("increment", "visual")
end)
vim.keymap.set("v", "<C-x>", function()
    require("dial.map").manipulate("decrement", "visual")
end)
vim.keymap.set("v", "g<C-a>", function()
    require("dial.map").manipulate("increment", "gvisual")
end)
vim.keymap.set("v", "g<C-x>", function()
    require("dial.map").manipulate("decrement", "gvisual")
end)

