return {
  -- it is documented to follow the order
  -- ...
  -- require("mason").setup()
  -- require("mason-lspconfig").setup()
  -- require("lspconfig").xxx.setup {}
  -- ...
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    event = "VeryLazy",
    opts = {},
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BUfReadPost", "BufWritePost", "BufNewFile" },
    config = function()
      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "Triggerd when lsp attaches to buffer",
        callback = function(event)
          local shared_opts = { buffer = event.buf }

          for _, entry in ipairs(LspKeyMappings()) do
            local modes, lhs, rhs, entry_opts = unpack(entry)
            opts = vim.tbl_deep_extend("force", shared_opts, entry_opts or { silent = true })
            vim.keymap.set(modes, lhs, rhs, opts)
          end
        end,
      })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    event = { "BUfReadPost", "BufWritePost", "BufNewFile" },
    config = function()
      local mason_lspconfig = require("mason-lspconfig")

      -- lsp servers that should always be installed
      -- notice that the name of lsp servers are defined by nvim-lspconfigs
      -- thus the name appear in mason does not work
      mason_lspconfig.setup({
        ensure_installed = {
          "lua_ls",
          "gopls",
          "rust_analyzer",
        },
        automatic_installation = {
          exclude = {},
        },
        handlers = {
          -- automatically setup lsp servers with default config
          function(server_name)
            require("lspconfig")[server_name].setup({
              on_attach = function(client, bufnr)
                require("lsp_signature").on_attach(signature_setup, bufnr)
              end,
            })
          end,
        }
      })
    end
  },
  {
    "ray-x/lsp_signature.nvim",
    lazy = true,
  },
}
