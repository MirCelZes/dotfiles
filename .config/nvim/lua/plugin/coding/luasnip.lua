return {
  "L3MON4D3/LuaSnip",
  version = "v2.*",
  dependencies = {
    {
      "rafamadriz/friendly-snippets",
      lazy = true,
    },
  },
  lazy = true,
  opts = {
    history = true,
  },
  config = function(_, otps)
    local from_vscode = require("luasnip.loaders.from_vscode")
    from_vscode.lazy_load()
    require("luasnip").setup(opts)
  end
}
