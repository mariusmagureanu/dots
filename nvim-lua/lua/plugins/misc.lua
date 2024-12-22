return {

  { "chriskempson/base16-vim", lazy = false },

  { "morhetz/gruvbox",         lazy = false },

  { --* Show images in markdown files, imagemagick-dev is required *--
    "3rd/image.nvim",
    ft = "markdown",
    opts = {
      backend = "kitty",
      integrations = {
        markdown = {
          enabled = true,
          download_remote_images = true,
          only_render_image_at_cursor = true,
          filetypes = { "markdown" }, -- markdown extensions (ie. quarto) can go here
        },
      },
    },
  },

  { --* Makes hover window prettier *--
    "Fildo7525/pretty_hover",
    opts = true,
    keys = {
      {
        "K",
        function()
          require("pretty_hover").hover()
        end,
        desc = "Hover",
      },
    },
  },

  { --* Beautiful markdown previewer *--
    "OXY2DEV/markview.nvim",
    ft = "markdown",
    opts = { -- Do not render text on the line you are on
      hybrid_modes = { "n" },
      callbacks = {
        on_enable = function(_, win)
          vim.wo[win].conceallevel = 2
          vim.wo[win].concealcursor = "c"
        end,
      },
    },
  },

  { --* toggle booleans, increment date & months via <C-a> & <C-x> *--
    "nat-418/boole.nvim",
    keys = { "<C-a>", "<C-x>" },
    opts = { mappings = { increment = "<C-a>", decrement = "<C-x>" } },
  },
}
