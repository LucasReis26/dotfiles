return {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			"jdtls",
			"emmet_ls",
			"clangd",
			"html",
			"texlab",
			"biome",
			"eslint",
		},
	},
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
	},
}
