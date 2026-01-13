require("config.lazy")
-- options
local tab_length = 2 -- this sets shiftwidth & tabstop settings to the same value
vim.o.updatetime = 1000
vim.o.shiftwidth = tab_length
vim.o.softtabstop = tab_length
vim.o.tabstop = tab_length
vim.o.number = true
vim.o.shell = 'zsh'
vim.diagnostic.config({ virtual_text = true })
vim.cmd[[colorscheme flexoki-moon]]
-- binds
--- buffer movement
vim.keymap.set("n", "<Tab>", "<cmd>bnext<CR>")
vim.keymap.set("n", "<S-Tab>", "<cmd>bprevious<CR>")
vim.keymap.set("n", "gw", "<cmd>bdelete<CR>")
--- LSP
vim.keymap.set("n", "gcf", vim.lsp.buf.format)
vim.keymap.set("n", "grd", vim.diagnostic.open_float)
--- debug
vim.keymap.set("n", "gB", function() require('dapui').toggle() end)
vim.keymap.set("n", "gb", function() require('dap').toggle_breakpoint() end)
--- terminal
vim.keymap.set("n", "g<Enter>", "<cmd>15sp<CR><cmd>term<CR>i")
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>")
--- misc. qol
vim.keymap.set("n", "<ESC>", "<cmd>silent nohls<CR>")

-- LSP custom configs
vim.lsp.config.basedpyright.settings.basedpyright = {
	analysis = {
		typeCheckingMode = "basic",
		diagnosticRuleSet = {
			reportUnknownParameterType = false,
			reportUnknownVariableType = false,
			reportAny = false,
		},
	}
}
