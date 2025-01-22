return {
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    lazy = true,
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    keys = {
      { "<leader>ff", ":Telescope find_files<cr>", desc = "Telescope find files" },
      { "<leader>fg", ":Telescope live_grep<cr>",  desc = "Telescope live grep" },
      { "<leader>fb", ":Telescope buffers<cr>",    desc = "Telescope find buffers" },
    },
    config = function()
      require("telescope").setup({
        defaults = {
          sorting_strategy = "ascending",
          layout_strategy = "horizontal",
          layout_config = {
            prompt_position = "top",
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",
          }
        },
      })
      require("telescope").load_extension("fzf")
    end
  },

  -- {
  --   "ibhagwan/fzf-lua",
  --   -- optional for icon support
  --   dependencies = { "nvim-tree/nvim-web-devicons" },
  --   cmd = "Fzflua",
  --   keys = {
  --     { "<leader>ff", ":FzfLua files<cr>",     desc = "Fuzzy find files" },
  --     { "<leader>fg", ":FzfLua live_grep<cr>", desc = "Fuzzy live grep" },
  --     { "<leader>fb", ":FzfLua buffers<cr>",   desc = "Fuzzy find buffers" },
  --   },
  --   config = function()
  --     local fzf = require("fzf-lua")

  --     fzf.setup({
  --       winopts = {
  --         preview = {
  --           default = "builtin",
  --           layout = "horizontal",
  --           scrollbar = "float",
  --         },
  --         fullscreen = false,
  --       },
  --       previewers = {
  --         builtin = {
  --           syntax = true,
  --           jump_to_line = true,
  --           title = false,
  --         }
  --       },
  --       files = {
  --         prompt = "Files❯ ",
  --       },
  --       fzf_opts = {
  --         ["--layout"] = "reverse-list",
  --         ["--cycle"] = true,
  --       },
  --     })
  --   end
  -- },

}
