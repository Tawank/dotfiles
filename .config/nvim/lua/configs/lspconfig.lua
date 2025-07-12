require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "ts_ls", "eslint", "clangd" } -- "cssls",
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
