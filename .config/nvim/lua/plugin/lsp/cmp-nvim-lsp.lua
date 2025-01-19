return {
  "hrsh7th/cmp-nvim-lsp",
  config = function()
    -- run before any lsp server
    -- nvim-lspconfig default capabilities
    -- to interact with nvim-cmp, use cmp_nvim_lsp's capabilities to replace them
    local capabilities = require("lspconfig").util.default_config.capabilities
    capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
  end,
}
