return{
	'neovim/nvim-lspconfig',
	version = "*",
	dependencies = { "hrsh7th/cmp-nvim-lsp" },
	config = function()

		local capabilities = require('cmp_nvim_lsp').default_capabilities()

		vim.lsp.config.jdtls = {
			capabilities = capabilities,
			cmd = { "jdtls" },
			root_dir = vim.fs.root(0,{".git", "pom.xml", "gradlew", "build.gradle"}),
		}
		vim.lsp.enable('jdtls')
		
	end,
}
