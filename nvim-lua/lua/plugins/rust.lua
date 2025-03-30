return {
  {
    "mrcjkb/rustaceanvim",
    version = "^5", -- Recommended
    lazy = false, -- This plugin is already lazy
  },
  {
    "chrisgrieser/nvim-lsp-endhints",
    event = "LspAttach",
    opts = {}, -- required, even if empty

    config = function()
      require("lsp-endhints").setup({
        icons = {
          type = "󰜁 ",
          parameter = "󰏪 ",
          offspec = " ", -- hint kind not defined in official LSP spec
          unknown = " ", -- hint kind is nil
        },
        label = {
          truncateAtChars = 20,
          padding = 1,
          marginLeft = 0,
          sameKindSeparator = ", ",
        },
        extmark = {
          priority = 50,
        },
        autoEnableHints = true,
      })
    end,
  },
}
