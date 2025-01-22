return {
	"rose-pine/neovim",
	name = "rose-pine",
  lazy = false,
  priority = 1000,
  init = function()
    vim.cmd("colorscheme rose-pine")
  end,
  opts = {
    variant = "main",
    styles = {
      italic = true,
      bold = true,
      transparency = false,
    },
    highlight_groups = {
      Visual = { fg = "base", bg = "gold", inherit = false },
    },
  },
}
