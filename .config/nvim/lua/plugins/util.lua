return {
  {
    "gpanders/editorconfig.nvim",
    event = "VeryLazy",
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        tsserver = false,
        ts_ls = false,
        vtsls = {},
        eslint = {},
      },
      setup = {
        ts_ls = function()
          return true
        end,
        eslint = function()
          require("lazyvim.util").lsp.on_attach(function(client)
            if client.name == "eslint" then
              client.server_capabilities.documentFormattingProvider = true
            end
          end)
        end,
      },
    },
  },
}
