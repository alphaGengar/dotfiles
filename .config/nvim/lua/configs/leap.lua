local M = {}

M.keys = {
  { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
  { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
  { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
}

M.opts = {}

function M.setup(opts)
  local leap = require("leap")
  local options = opts or M.opts

  for k, v in pairs(options) do
    leap.opts[k] = v
  end

  leap.add_default_mappings(true)
  vim.keymap.del({ "x", "o" }, "x")
  vim.keymap.del({ "x", "o" }, "X")
end

return M
