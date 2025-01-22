return {
  "kylechui/nvim-surround",
  version = "*",
  event = { "InsertEnter", "InsertLeave", "BufNewFile" },
  config = function()
    require("nvim-surround").setup({})
  end,
}
