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
--- LSP
vim.keymap.set("n", "gcf", vim.lsp.buf.format)
vim.keymap.set("n", "grd", vim.diagnostic.open_float)
--- debug
vim.keymap.set("n", "gB", function() require('dapui').toggle() end)
vim.keymap.set("n", "gb", function() require('dap').toggle_breakpoint() end)

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
