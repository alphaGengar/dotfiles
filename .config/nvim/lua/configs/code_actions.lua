return {
  backend = { "telescope", "nui" },

  telescope = vim.tbl_extend(
    "force",
    require("telescope.themes").get_dropdown({
      layout_config = {
        width = 0.4,
        height = 0.4,
      },
      borderchars = {
        prompt = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        results = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
      },
    }),
    {
      previewer = false,
    }
  ),

  nui = {
    dir = "row",
    layout = {
      position = "50%",
      size = {
        width = "40%",
        height = "30%",
      },
      min_width = 40,
      min_height = 10,
      relative = "editor",
    },
    preview = {
      size = "60%",
      border = {
        style = "single",
        padding = { 0, 1 },
        text = {
          top = " Preview ",
        },
      },
    },
    select = {
      size = "40%",
      border = {
        style = "single",
        padding = { 0, 1 },
        text = {
          top = " Actions ",
        },
      },
    },
  },
}
