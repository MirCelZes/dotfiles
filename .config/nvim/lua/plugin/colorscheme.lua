return {
	"rose-pine/neovim",
	name = "rose-pine",
  lazy = false,
  priority = 1000,
  init = function()
    vim.cmd("colorscheme rose-pine")
  end,
  opts = {
    styles = {
      italic = true,
      bold = true,
    },
    highlight_groups = {
      Visual = { fg = "base", bg = "gold", inherit = false },
    },
  },
}
