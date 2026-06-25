local M = {}

local uv = vim.uv or vim.loop

-- Map of Kitty themes to Neovim colorschemes
local themes_map = {
  ["Catppuccin-Latte"] = "catppuccin-latte",
  ["Catppuccin-Mocha"] = "catppuccin-mocha",
}

-- Map of Neovim colorschemes to Kitty themes
local kitty_themes_map = {
  ["catppuccin-latte"] = "Catppuccin-Latte",
  ["catppuccin-mocha"] = "Catppuccin-Mocha",
}

-- Reads the current theme configured in Kitty
function M.get_kitty_theme()
  local file_path = vim.fn.resolve(vim.fn.expand("~/.config/kitty/current-theme.conf"))
  local file = io.open(file_path, "r")
  if not file then
    return "catppuccin-mocha"
  end
  local content = file:read("*a")
  file:close()

  for kitty_theme, nvim_theme in pairs(themes_map) do
    if content:find(kitty_theme, 1, true) then
      return nvim_theme
    end
  end

  return "catppuccin-mocha"
end

-- Synchronizes Neovim's theme from Kitty's theme config
function M.sync_from_kitty()
  local theme = M.get_kitty_theme()
  if vim.g.colors_name ~= theme then
    vim.g.theme_sync_updating = true
    vim.cmd("colorscheme " .. theme)
    vim.g.theme_sync_updating = false
  end
end

-- Initializes the two-way sync
function M.setup()
  -- 1. Watch for Neovim colorscheme changes to update Kitty
  vim.api.nvim_create_autocmd("ColorScheme", {
    pattern = "*",
    callback = function(ev)
      if vim.g.theme_sync_updating then
        return
      end

      local colors_name = ev.match
      local kitty_theme = kitty_themes_map[colors_name]

      if kitty_theme then
        -- Run kitty kitten theme changer to update kitty theme across all windows
        vim.fn.jobstart({ "kitty", "+kitten", "themes", "--reload-in=all", kitty_theme })
      end
    end,
  })

  -- 2. Watch for Kitty configuration changes to update Neovim
  local resolved_path = vim.fn.resolve(vim.fn.expand("~/.config/kitty/current-theme.conf"))
  local resolved_dir = vim.fn.fnamemodify(resolved_path, ":h")

  local handle = uv.new_fs_event()
  if handle then
    handle:start(resolved_dir, {}, vim.schedule_wrap(function(err, filename, events)
      if err then
        return
      end
      if filename == "current-theme.conf" then
        M.sync_from_kitty()
      end
    end))
  end
end

return M
