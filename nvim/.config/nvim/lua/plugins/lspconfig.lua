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
		vim.lsp.config.emmet_ls = {
			capabilities = capabilities,
			filetypes = {
				"html",
				"typescriptreact",
				"javascriptreact",
				"css",
				"markdown",
			}
		}
		vim.lsp.config.clangd = {
			capabilities = capabilities,
			cmd = {
				"clangd",
				"--background-index",
				"--clang-tidy",
				"--header-insertion=iwyu",
				"--completion-style=detailed",
				"--function-arg-placeholders",
				"--fallback-style=llvm"
			},
			root_dir = vim.fs.root(0, { ".git", "compile_commands.json", "compile_flags.txt", ".clangd" }),
		}
		vim.lsp.enable('clangd')
		vim.lsp.enable('emmet_ls')
		vim.lsp.enable('jdtls')
		
	end,
}
