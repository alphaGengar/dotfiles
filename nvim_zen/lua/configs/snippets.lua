local luasnip = require("luasnip")

-- Explicitly require the loaders to avoid indexing nil
require("luasnip.loaders.from_lua").load({ paths = vim.fn.stdpath("config") .. "/lua_snippets/my_snippets" })
require("luasnip.loaders.from_vscode").lazy_load()
