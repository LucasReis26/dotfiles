return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	config = function()
		local api = require('nvim-tree.api')
		vim.keymap.set('n', '<c-n>', api.tree.toggle, { noremap = true, silent = true })
		-- NERD TREE CONFIGS
		-- disable netrw at the very start of your init.lua
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- optionally enable 24-bit colour
		vim.opt.termguicolors = true

		-- empty setup using defaults
		-- require("nvim-tree").setup()

		-- OR setup with some options
		require("nvim-tree").setup({
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 30,
			},
			renderer = {
				group_empty = true,
			},
			filters = {
				dotfiles = true,
				git_ignored = false,
			},
		})
	end
}
