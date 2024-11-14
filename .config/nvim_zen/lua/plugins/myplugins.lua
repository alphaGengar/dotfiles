local lazy_plugins = {
  -- Navigation
  {
    "ggandor/leap.nvim",
    enabled = true,
    opts = function()
      return require("configs.leap")
    end,
  },

  -- Autocompletion and Snippets
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function()
      require("configs.cmp")
    end,
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "saadparwaiz1/cmp_luasnip", -- Snippet completion source
    }
  },

  {
    "L3MON4D3/LuaSnip",
    event = "InsertEnter",
    config = function()
      require("configs.snippets")
    end,
    dependencies = {
      "rafamadriz/friendly-snippets", -- Predefined snippets collection
    }
  },

  {
    "rafamadriz/friendly-snippets",
    lazy = true,
  },

  -- Competitive Programming
  {
    "xeluxee/competitest.nvim",
    event = "VeryLazy",
    ft = "cpp",
    dependencies = {
      "MunifTanjim/nui.nvim", -- UI components for competitest
    },
    config = function()
      require("configs.competitest")
    end,
  },

  -- ayy key fuck these ni**as up
  {
    "conform.nvim",
    enabled = false,
  },
  {
    "neovim/nvim-lspconfig",
    enabled = false,
  },
  {
    "williamboman/mason.nvim",
    enabled = false,
  },
  {
    "menu",
    enabled = false,
  },
  {
    "volt",
    enabled = false,
  },

}


return lazy_plugins
