return {
  "ibhagwan/fzf-lua",
  -- optional for icon support
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader><space>f", ":FzfLua files<cr>",                                     desc = "Fuzzy find files" },
    { "<leader><space>g", ":FzfLua live_grep<cr>",                                 desc = "Fuzzy live grep" },
    { "<leader><space>b", ":FzfLua buffers sort_mru=true, sort_lastused=true<cr>", desc = "Fuzzy find buffers" },
    { "<leader><space>:", ":FzfLua command_history<cr>",                           desc = "Fuzzy find command histories" },
    { "<leader><space>r", ":FzfLua resume<cr>",                                    desc = "Fuzzy find resume" },
    { "<leader><space>s", ":FzfLua lsp_workspace_symbols<cr>",                     desc = "Fuzzy find symbols in current workspace" },
    { "<leader><space>a", ":FzfLua lsp_code_actions<cr>",                     desc = "Fuzzy find symbols in current workspace" },
  },
  config = function()
    local fzf = require("fzf-lua")
    -- chafa as img previewer
    local img_previewer
    if vim.fn.executable("chafa") == 1 then
      img_previewer = vim.list_extend({ "chafa" }, { "{file}", "--format=symbols" })
    end

    fzf.setup({
      -- global config
      defaults = {
        formatter = "path.dirname_first",
      },
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
          extensions = {
            ["png"] = img_previewer,
            ["jpg"] = img_previewer,
            ["jpeg"] = img_previewer,
            ["gif"] = img_previewer,
          },
        },
      },
      files = {
        cwd_prompt = false,
        prompt = "Files❯ ",
      },
      buffers = {
        cwd_prompt = false,
        prompt = "Buffers❯ ",
      },
      fzf_opts = {
        ["--layout"] = "reverse-list",
        ["--cycle"] = true,
      },
    })
  end
}
