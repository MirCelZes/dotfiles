return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    winopts = {
      split = "belowright 10new",
      border = "single",
      preview = {
        default = "bat",
        border = "border",
        layout = "horizontal",
      },
    },
  },
}
