local M = {}

M.base46 = {
  theme = "gruvchad",
  hl_add = {},
  hl_override = {},
  integrations = {},
  changed_themes = {},
  transparency = true,
  theme_toggle = { "solarized_dark", "gruvchad" },
}

M.ui = {
  cmp = {
    icons = false,
    lspkind_text = false,
    style = "flat_default",
  },
  telescope = { style = "bordered" },
  statusline = {
    enabled = true,
    theme = "default",
  },
  tabufline = {
    enabled = false,
  },
}

M.nvdash = { load_on_startup = false }

M.term = {
  winopts = { number = false },
  sizes = { sp = 0.3, vsp = 0.2, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
  float = {
    relative = "editor",
    row = 0.3,
    col = 0.25,
    width = 0.5,
    height = 0.4,
    border = "single",
  },
}

M.cheatsheet = { enabled = false }

return M
