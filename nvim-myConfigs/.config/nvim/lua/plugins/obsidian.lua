return {
	"epwalsh/obsidian.nvim",
	version = "*",  -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
	cmd = {
        "ObsidianToday",
        "ObsidianNew",
        "ObsidianQuickSwitch",
        "ObsidianSearch",
        "ObsidianWorkspace",
    },
	event = {
		-- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		-- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
		-- refer to `:h file-pattern` for more examples
		"BufReadPre /home/cinema/obsidian/*.md",
		"BufNewFile /home/cinema/obsidian/*.md",
	},
	dependencies = {
		-- Required.
		"nvim-lua/plenary.nvim",

		-- see below for full list of optional dependencies 👇
	},
	opts = {
		workspaces = {
			{
				name = "personal",
				path = "~/obsidian",
			},

			-- other fields ...


		},

		templates = {
			folder = "./Assets/Templates",
			date_format = "%Y-%m-%d-%a",
			time_format = "%H:%M",
		},
		daily_notes={
			folder="Vida Pessoal/Daily Notes",
		},
		ui = { 
			enable = true 
		},
		disable_frontmatter = true,
		-- see below for full list of options 👇
	},
}
