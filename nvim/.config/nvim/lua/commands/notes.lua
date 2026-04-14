local M = {}

-- ===============
-- Comando: NewAEDSIII
-- ===============

function M.create_new_aeds_iii()
    -- Define o diretório base
    local note_dir = vim.fn.expand(string.format(
        "~/obsidian/Estudos/Faculdade/5 Período/AEDS-III/%s",
        os.date("%Y-%m")
    ))

    -- Verifica se o diretório existe; se não, cria (o parâmetro "p" permite criar pais se necessário)
    if vim.fn.isdirectory(note_dir) == 0 then
        vim.fn.mkdir(note_dir, "p")
    end

    local file_path = string.format(
        "%s/AULA %s.md",
        note_dir,
        os.date("%Y-%m-%d")
    )

    -- Abre o arquivo
    vim.cmd("edit " .. file_path)

    -- Aplica o template do Obsidian.nvim
    vim.cmd("ObsidianTemplate Algoritmos e Estruturas de Dados III")

    print("Nova nota criada: " .. file_path)

    -- Salva o arquivo inicial
    vim.cmd("write")
end

vim.api.nvim_create_user_command("NewAEDSIII",M.create_new_aeds_iii,{})

-- ==============
-- Comando: NewLP
-- ==============

function M.create_new_lp()

	local note_dir = string.format(
		"~/obsidian/Estudos/Faculdade/5 Período/LP/%s",
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


-- ==============
-- Comando: NewACII
-- ==============

function M.create_new_acii()

	local note_dir = string.format(
		"~/obsidian/Estudos/Faculdade/5 Período/AC-II/%s",
		os.date("%Y-%m")
	)

	local file_path = string.format(
		"%s/AULA %s.md",
		note_dir,
		os.date("%Y-%m-%d")
	)

	vim.cmd("edit " .. vim.fn.expand(file_path))

	vim.cmd("ObsidianTemplate Arquitetura de Computadores II")

	print("Nova nota criada: " .. file_path)

	vim.cmd("write")

end

vim.api.nvim_create_user_command("NewACII",M.create_new_acii,{})


return M
