return {
  {
    "nvimtools/none-ls.nvim",
    lazy = false,
    config = function()
      local null_ls = require("null-ls")
      local formatting = null_ls.builtins.formatting
      local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

      null_ls.setup({

        sources = {
          formatting.stylua, -- lua formatter
          formatting.gofmt, -- go formatter
          formatting.autopep8, --python formatter
          formatting.jq,
          formatting.yamlfmt,
          formatting.shfmt,
          formatting.rustfmt,
          formatting.terraform_fmt,
        },

        on_attach = function(client, bufnr)
          if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ async = false })
              end,
            })
          end
        end,
      })
    end,
  },
}
