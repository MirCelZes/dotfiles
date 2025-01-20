return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>ff", ":FzfLua files<cr>", desc = "Fuzzy find files" },
    { "<leader>fg", ":FzfLua live_grep<cr>", desc = "Fuzzy find files" },
  },
  opts = {},
}
