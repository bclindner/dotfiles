-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- file browser QOL
		{
			"nvim-telescope/telescope.nvim",
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
			keys = {
				{ "gp", "<cmd>Telescope<CR>" },
				{ "gT", "<cmd>Telescope find_files<CR>" },
			},
		},
		{
			"nvim-tree/nvim-tree.lua",
			config = function()
				vim.g.loaded_netrw = 1
				vim.g.loaded_netrwPlugin = 1
				require("nvim-tree").setup({})
			end,
			keys = {
				{ "gt", "<cmd>NvimTreeToggle<CR>" },
			},
		},
		-- language-specific tool manager
		{
			"mason-org/mason.nvim",
			opts = {},
		},
		-- lsp
		{
			"neovim/nvim-lspconfig",
		},
		{
			"mason-org/mason-lspconfig.nvim",
			opts = {},
			dependencies = {
				"mason-org/mason.nvim",
				"neovim/nvim-lspconfig",
			},
		},
		{ "folke/trouble.nvim", opts = {} },
		-- debugging
		{
			"mfussenegger/nvim-dap",
		},
		{ "jay-babu/mason-nvim-dap.nvim" },
		{ "rcarriga/nvim-dap-ui",
			dependencies = {
				"mfussenegger/nvim-dap",
				"nvim-neotest/nvim-nio",
			},
			opts = {}
		},
		-- start screen
		{
			"goolord/alpha-nvim",
			dependencies = { "nvim-mini/mini.icons" },
			config = function()
				require("alpha").setup(require("alpha.themes.startify").config)
			end,
		},
		-- statusline
		{
			"nvim-lualine/lualine.nvim",
			opts = {},
			dependencies = { "nvim-tree/nvim-web-devicons" },
		},
		-- treesitter for highlighting
		{
			"nvim-treesitter/nvim-treesitter",
			branch = 'main',
			lazy = false,
			build = ":TSUpdate"
		},
		-- markdown viewer
		{
			"MeanderingProgrammer/render-markdown.nvim",
			dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-mini/mini.icons" },
			opts = {},
		},
		-- completion
		{
			"nvim-mini/mini.completion",
			version = false,
			name = "mini.git",
			opts = {},
		},
		-- git
		{
			'nvim-mini/mini-git',
			version = false,
		},
		-- colorscheme
		{ "nuvic/flexoki-nvim", name = "flexoki" },
	},
	install = { colorscheme = { "flexoki-moon" } },
	-- automatically check for plugin updates
	checker = { enabled = true },
})
