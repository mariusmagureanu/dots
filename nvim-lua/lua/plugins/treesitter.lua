return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "rust", "python" },

			sync_install = false,
			autotag = { enable = true },
			auto_install = true,

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = true,
			},
		})
	end,
}
