return {

  {
    "neovim/nvim-lspconfig",

    lazy = false,
    dependencies = {
      {
        "saghen/blink.cmp",

        dependencies = "rafamadriz/friendly-snippets",
        lazy = false,
        version = "*",
        event = { "InsertEnter", "CmdlineEnter" },
        opts = {
          keymap = { preset = "enter" },

          fuzzy = { prebuilt_binaries = { download = true } },

          appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = "mono",
          },

          signature = { enabled = true, window = { border = "rounded" } },

          completion = {
            --    list = { selection = { preselect = false, auto_insert = false } }, -- Add completion text on select
            accept = { auto_brackets = { enabled = true } }, -- Add brackets to completions
            documentation = { auto_show = true, auto_show_delay_ms = 0, window = { border = "rounded" } },
            ghost_text = { enabled = false },
            trigger = { prefetch_on_insert = true }, -- Experimental: prefetch completions on insert mode
            menu = {
              border = "rounded",
              draw = {
                treesitter = { "lsp" }, -- Highlight the "kind" icons by treesitter
                columns = {     -- Nvim-cmp like layout
                  { "label",     "label_description", gap = 1 },
                  { "kind_icon", "kind",              gap = 1 },
                },
                components = {
                  label = {
                    text = function(ctx)
                      return require("colorful-menu").blink_components_text(ctx)
                    end,
                    highlight = function(ctx)
                      return require("colorful-menu").blink_components_highlight(ctx)
                    end,
                  },
                },
              },
            },
          },

          cmdline = {
            enabled = false,
          },

          sources = {
            default = { "lazydev", "lsp", "path", "snippets", "buffer" },
            providers = {
              lazydev = {
                name = "LazyDev",
                module = "lazydev.integrations.blink",
                -- make lazydev completions top priority (see `:h blink.cmp`)
                score_offset = 100,
              },
            },
          },
        },
        opts_extend = { "sources.default" },
      },

      { "hrsh7th/cmp-buffer" },    -- source for text in buffer
      { "hrsh7th/cmp-path" },      -- source for file system paths
      { "petertriho/cmp-git" },    -- git
      { "delphinus/cmp-ctags" },   -- ctags source
      -- snippets
      { "L3MON4D3/LuaSnip" },      -- snippet engine
      { "saadparwaiz1/cmp_luasnip" }, -- for autocompletion

      {
        "folke/lazydev.nvim",
        opts = {
          library = {
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },

      { -- optional cmp completion source for require statements and module annotations
        "hrsh7th/nvim-cmp",
        opts = function(_, opts)
          opts.sources = opts.sources or {}
          table.insert(opts.sources, {
            name = "lazydev",
            group_index = 0, -- set group index to 0 to skip loading LuaLS completions
          })
        end,
      },
    },

    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      local lspconfig = require("lspconfig")

      lspconfig["lua_ls"].setup({ capabilities = capabilities })
      lspconfig["terraformls"].setup({ capabilities = capabilities })
      lspconfig["gopls"].setup({ capabilities = capabilities })
      lspconfig["bashls"].setup({ capabilities = capabilities })
      lspconfig["pyright"].setup({ capabilities = capabilities })
      lspconfig["clangd"].setup({ capabilities = capabilities })
    end,
  },
}
