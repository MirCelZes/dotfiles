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
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
    },
    config = function()
      local mason_lspconfig = require("mason-lspconfig")

      -- lsp servers that should always be installed
      -- notice that the name of lsp servers are defined by nvim-lspconfigs
      -- thus the name appear in mason does not work
      mason_lspconfig.setup({
        ensure_installed = {
          "lua_ls",
        },
        automatic_installation = {
          exclude = {},
        },
      })

      -- using mason-lspconfig to setup lsp servers automatically
      mason_lspconfig.setup_handlers({
        -- default handler (optional)
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end,

        -- notice that all the handler below will overwrite the default one
        -- cuz setup() should onlu be invoked once
      })

    end
  },
}
