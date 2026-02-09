**This repo is supposed to used as config by NvChad users!**

- The main nvchad repo (NvChad/NvChad) is used as a plugin by this repo.
- So you just import its modules , like `require "nvchad.options" , require "nvchad.mappings"`
- So you can delete the .git from this repo ( when you clone it locally ) or fork it :)

# Config Map

- `init.lua` bootstraps `lazy.nvim`, loads NvChad, and wires your local modules.
- `lua/options.lua` contains all editor options.
- `lua/mappings.lua` contains all keymaps, with LSP globals sourced from `lua/configs/lsp_keymaps.lua`.
- `lua/plugins/init.lua` defines core plugins (NvChad + treesitter + lspconfig entry).
- `lua/plugins/myplugins.lua` defines your extra plugins and their lazy-loading rules.
- `lua/configs/` contains per-plugin configuration modules.
- `lua/configs/lspconfig.lua` contains LSP server setup and diagnostics.
- `lua/configs/lsp_keymaps.lua` contains all LSP keymaps (global + buffer-local).
- `lua/chadrc.lua` holds NvChad UI/theme settings.

# Credits

1) Lazyvim starter https://github.com/LazyVim/starter as nvchad's starter was inspired by Lazyvim's . It made a lot of things easier!
