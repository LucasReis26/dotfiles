return {
	'stevearc/conform.nvim',
	enabled = false,
	opts = {
		formatters_by_ft = {
			javascript = {"prettierd", "prettier", stop_after_first = true},
			typescriptreact = {"prettierd", "prettier", stop_after_first = true}
		},
		format_on_save = {
			timeout_ms = 500,
			-- lsp_format = "fallback",
		},
	},

}
