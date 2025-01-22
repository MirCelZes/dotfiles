return {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("hlchunk").setup({
      chunk = {
        enable = true,
        use_treesitter = true,
        chars = {
          horizontal_line = "─",
          vertical_line = "│",
          left_top = "╭",
          left_bottom = "╰",
          right_arrow = ">",
        },
        styles = "#31748f",
        duration = 100,
        delay = 100,
      },
      line_num = {
        enable = false,
      },
      indent = {
        enable = false,
      },
      blank = {
        enable = false,
      },
    })
  end
}
