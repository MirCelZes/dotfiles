return {
  "mikavilpas/yazi.nvim",
  keys = {
    {
      "<leader>ft", "<cmd>Yazi<cr>", mode = { "n", "v" }, desc = "Open yazi at the current file",
    },
  },
  opts = {
    open_for_directories = false,
    keymaps = {
      show_help = '<f1>',
    },
  },
}
