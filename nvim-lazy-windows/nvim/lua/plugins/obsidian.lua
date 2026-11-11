return {
  "obsidian-nvim/obsidian.nvim",
  version = "*", -- use latest release, remove to use latest commit
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false, -- this will be removed in 4.0.0
    workspaces = {
      {
        name = "Pessoal",
        path = "~/Insync/luctreis@gmail.com/Google Drive/myNotes/Pessoal/",
      },
      {
        name = "Faculdade",
        path = "~/Insync/luctreis@gmail.com/Google Drive/myNotes/Faculdade/",
      },
    },
    notes_subdir = "Inbox",
    new_notes_location = "notes_subdir",
    daily_notes = {
      folder = "Dailies",
    },
  },
}
