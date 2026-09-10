return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	init = function()
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1
	end,
	config = function()


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

		local api = require('nvim-tree.api')
		vim.keymap.set('n', '<c-n>', api.tree.toggle, { noremap = true, silent = true })
		vim.opt.termguicolors = true
	end
}
