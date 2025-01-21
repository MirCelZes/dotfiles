return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
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
}
