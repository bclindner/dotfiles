require("config.lazy")
-- options
local tab_length = 2 -- this sets shiftwidth & tabstop settings to the same value
vim.o.updatetime = 1000
vim.o.shiftwidth = tab_length
vim.o.softtabstop = tab_length
vim.o.tabstop = tab_length
vim.o.number = true
vim.o.shell = 'zsh'
-- binds
vim.keymap.set("n", "gcf", vim.lsp.buf.format)
vim.keymap.set("n", "grd", vim.diagnostic.open_float)
vim.diagnostic.config({ virtual_text = true })
