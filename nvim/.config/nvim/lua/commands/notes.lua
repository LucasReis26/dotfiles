local M = {}

-- ===============
-- Comando: NewAC1
-- ===============

function M.create_new_ac1()

	local note_dir = string.format(
		"~/obsidian/Estudos/Faculdade/4 Período/AC-I/%s",
		os.date("%Y-%m")
	)

	local file_path = string.format(
		"%s/AULA %s.md",
		note_dir,
		os.date("%Y-%m-%d")
	)

	vim.cmd("edit " .. vim.fn.expand(file_path))

	vim.cmd("ObsidianTemplate Arquitetura de Computadores I")

	print("Nova nota criada: " .. file_path)

	vim.cmd("write")

end

vim.api.nvim_create_user_command("NewAC1",M.create_new_ac1,{})

-- ==============
-- Comando: NewLP
-- ==============

function M.create_new_lp()

	local note_dir = string.format(
		"~/obsidian/Estudos/Faculdade/4 Período/LP/%s",
		os.date("%Y-%m")
	)

	local file_path = string.format(
		"%s/AULA %s.md",
		note_dir,
		os.date("%Y-%m-%d")
	)

	vim.cmd("edit " .. vim.fn.expand(file_path))

	vim.cmd("ObsidianTemplate Linguagens de Programação")

	print("Nova nota criada: " .. file_path)

	vim.cmd("write")

end

vim.api.nvim_create_user_command("NewLP",M.create_new_lp,{})

return M
