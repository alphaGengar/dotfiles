-- Load NvChad base mappings
require "nvchad.mappings"

-- Mapping helper function
local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Organize mappings by category
local M = {}

-- General mappings
M.general = {
  { "n", ";",          ":",                       { desc = "CMD enter command mode" } },
  { "n", "<leader>n",  "<cmd> set nu! <CR>",      { desc = "Toggle line number" } },
  { "n", "<leader>b",  "<cmd> enew <CR>",         { desc = "New buffer" } },
  { "n", "<leader>ch", "<cmd> NvCheatsheet <CR>", { desc = "Mapping cheatsheet" } },
  { "n", "<C-c>",      "<cmd> %y+ <CR>",          { desc = "Copy whole file" } },
  { "i", "jk",         "<ESC>",                   { desc = "Exit insert mode" } },
}

-- Competitive Programming mappings (CompetiTest plugin)
M.competitive = {
  { "n", "<leader>cta", ":CompetiTest add_testcase<Space><CR>",      { desc = "Add Testcase" } },
  { "n", "<leader>cte", ":CompetiTest edit_testcase<Space><CR>",     { desc = "Edit Testcase" } },
  { "n", "<leader>ctr", ":CompetiTest run<Space><CR>",               { desc = "Run Testcases" } },
  { "n", "<leader>ctc", ":CompetiTest receive contest<Space><CR>",   { desc = "Receive Contest" } },
  { "n", "<leader>ctp", ":CompetiTest receive problem<Space><CR>",   { desc = "Receive Problem" } },
  { "n", "<leader>ctg", ":CompetiTest receive testcases<Space><CR>", { desc = "Receive Testcases" } },
  { "n", "<leader>cf",  ":lua CopyCurrentFileName()<CR>",            { desc = "Copy File Name" } },
}

-- Utility mappings
M.utils = {
  { "n", "<leader>tt", function() require("base46").toggle_transparency() end, { desc = "Toggle transparency" } },
}


-- Apply all mappings
local function load_mappings()
  for _, category in pairs(M) do
    for _, mapping in ipairs(category) do
      local mode, lhs, rhs, opts = unpack(mapping)
      map(mode, lhs, rhs, opts)
    end
  end
end

local unmap = vim.keymap.del

-- Unbind each mapping that isn't used in Zen setup

unmap("n", "<Esc>") -- Clear highlights
unmap("n", "<C-s>") -- Save file
unmap("n", "<C-c>") -- Copy whole file
unmap("n", "<leader>n") -- Toggle line number
unmap("n", "<leader>rn") -- Toggle relative number

-- Formatting (if LSP disabled in Zen setup)
unmap("n", "<leader>fm")

-- LSP diagnostics (if unused)
unmap("n", "<leader>ds")

unmap("n", "<leader>ch")
-- Terminal mappings (if unused)
unmap("t", "<C-x>")
unmap("n", "<leader>h")
unmap("n", "<leader>v")
unmap({ "n", "t" }, "<A-v>")
unmap({ "n", "t" }, "<A-h>")
unmap({ "n", "t" }, "<A-i>")

-- WhichKey mappings (if unused)
unmap("n", "<leader>wK")
unmap("n", "<leader>wk")

-- Initialize mappings
load_mappings()

-- Export mappings table for potential external use
return M
