return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>ff", ":FzfLua files<cr>",     desc = "Fuzzy find files" },
    { "<leader>fg", ":FzfLua live_grep<cr>", desc = "Fuzzy live grep" },
    { "<leader>fb", ":FzfLua buffers<cr>", desc = "Fuzzy find buffers" },
  },
  config = function()
    local fzf = require("fzf-lua")

    fzf.setup({
      winopts = {
        preview = {
          default = "builtin",
          layout = "horizontal",
          scrollbar = "float",
        },
        fullscreen = false,
      },
      previewers = {
        builtin = {
          syntax = true,
          jump_to_line = true,
          title = false,
        }
      },
      files = {
        prompt = "Files❯ ",
      },
      fzf_opts = {
        ["--cycle"] = true,
      },
    })
  end
}
