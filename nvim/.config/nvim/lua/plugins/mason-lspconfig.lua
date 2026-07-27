return {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
		{ "mason-org/mason.nvim", opts = {} },
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()
		local lspconfig = require("lspconfig")

		require("mason-lspconfig").setup({
			ensure_installed = {
				"jdtls",
				"emmet_ls",
				"clangd",
				"html",
				"texlab",
				"biome",
				"eslint",
			},
			handlers = {
				-- Handler padrão para qualquer servidor instalado
				function(server_name)
					lspconfig[server_name].setup({
						capabilities = capabilities,
					})
				end,

				["jdtls"] = function()
					lspconfig.jdtls.setup({
						capabilities = capabilities,
						cmd = { "jdtls" },
						root_dir = vim.fs.root(0, { ".git", "pom.xml", "gradlew", "build.gradle" }),
					})
				end,

				["emmet_ls"] = function()
					lspconfig.emmet_ls.setup({
						capabilities = capabilities,
						filetypes = {
							"html",
							"typescriptreact",
							"javascriptreact",
							"css",
							"markdown",
							"javascript",
						},
					})
				end,

				["clangd"] = function()
					lspconfig.clangd.setup({
						capabilities = capabilities,
						cmd = {
							"clangd",
							"--background-index",
							"--clang-tidy",
							"--header-insertion=iwyu",
							"--completion-style=detailed",
							"--function-arg-placeholders",
							"--fallback-style=llvm",
						},
						root_dir = vim.fs.root(0, { ".git", "compile_commands.json", "compile_flags.txt", ".clangd" }),
					})
				end,

				["html"] = function()
					lspconfig.html.setup({
						capabilities = capabilities,
						filetypes = { "html", "templ", "javascript", "javascriptreact" },
					})
				end,

				["texlab"] = function()
					lspconfig.texlab.setup({
						capabilities = capabilities,
						filetypes = { "tex", "markdown" },
					})
				end,

				["biome"] = function()
					lspconfig.biome.setup({
						capabilities = capabilities,
						filetypes = { "typescriptreact" },
					})
				end,

				["eslint"] = function()
					lspconfig.eslint.setup({
						capabilities = capabilities,
						filetypes = { "typescriptreact", "javascript", "javascriptreact" },
					})
				end,
			},
		})
	end,
}
