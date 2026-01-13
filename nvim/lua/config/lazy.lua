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
				-- default telescope
				{ "gp", "<cmd>Telescope<CR>" },
				-- basic subcommand binds inspired by telescope's README
				{ "gT", "<cmd>Telescope find_files<CR>" },
				{ "gk", "<cmd>Telescope find_files<CR>" },
				{ "gK", "<cmd>Telescope find_files hidden=true<CR>" },
				{ "gff", "<cmd>Telescope find_files<CR>" },
				{ "gfg", "<cmd>Telescope live_grep<CR>" },
				{ "gfb", "<cmd>Telescope buffers<CR>" },
				{ "gfh", "<cmd>Telescope help_tags<CR>" },
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
			config = function()
				local dap = require('dap')
				dap.configurations.python = {
					type = 'debugpy';
					request = 'launch';
					name = "Launch file";
					program = "${file}";
					pythonPath = function()
						return '/usr/bin/python'
					end;
				}

			end,
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
			name = "mini.completion",
			opts = {},
		},
		-- git
		{
			'nvim-mini/mini-git',
			name = "mini.git",
			opts = {},
			version = false,
			keys = {
				{ "gGc", "<cmd>Git commit<CR>" },
				{ "gGC", "<cmd>Git commit -a<CR>" },
				{ "gGa", "<cmd>Git add %<CR>" },
			},
		},
		{ 'FabijanZulj/blame.nvim',
			opts = {},
		},
		-- colorscheme
		{ "nuvic/flexoki-nvim", name = "flexoki" },
	},
	install = { colorscheme = { "flexoki-moon" } },
	-- automatically check for plugin updates
	checker = {
		enabled = true,
		interval = 86400, -- once per day at most
	},
})
