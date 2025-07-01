return {
	"folke/zen-mode.nvim",
	version = "*",
	keys = {
		{"<leader>z","<cmd>ZenMode<cr>", desc="ZenMode"}
	},
	opts = {
		window = {
			backdrop = 0.95,
			width = 0.85,
			height = 1,
			options = {
				number = false,
				relativenumber = false,
			}
		},
		plugins = {
			options = {
				enabled = true,
			}
		}
	}
}
