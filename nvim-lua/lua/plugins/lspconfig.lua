local fn = vim.fn

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
					-- 'default' for mappings similar to built-in completion
					-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
					-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
					-- See the full "keymap" documentation for information on defining your own keymap.
					keymap = { preset = "enter" },

					fuzzy = { prebuilt_binaries = { download = false } },

					-- keymap = {
					-- 	["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
					-- 	["<C-e>"] = { "hide" },
					-- 	["<CR>"] = { "accept", "fallback" },
					-- 	["<Tab>"] = { "select_next", "fallback" },
					-- 	["<S-Tab>"] = { "select_prev", "fallback" },
					-- 	["<C-d>"] = { "scroll_documentation_down", "fallback" },
					-- 	["<C-u>"] = { "scroll_documentation_up", "fallback" },
					-- 	["<C-n>"] = { "snippet_forward", "fallback" },
					-- 	["<C-p>"] = { "snippet_backward", "fallback" },
					-- 	["<Down>"] = {},
					-- 	["<Up>"] = {},
					--
					-- 	cmdline = {
					-- 		["<CR>"] = { "accept", "fallback" },
					-- 		["<Tab>"] = { "select_next", "fallback" },
					-- 		["<S-Tab>"] = { "select_prev", "fallback" },
					-- 	},
					-- },

					appearance = {
						use_nvim_cmp_as_default = true,
						nerd_font_variant = "mono",
					},

					signature = { enabled = true, window = { border = "rounded" } },

					completion = {
						list = { selection = "auto_insert" }, -- Add completion text on select
						accept = { auto_brackets = { enabled = true } }, -- Add brackets to completions
						documentation = { auto_show = true, auto_show_delay_ms = 0, window = { border = "rounded" } },
						ghost_text = { enabled = true },
						trigger = { prefetch_on_insert = true }, -- Experimental: prefetch completions on insert mode
						menu = {
							border = "rounded",
							draw = {
								treesitter = { "lsp" }, -- Highlight the "kind" icons by treesitter
								columns = { -- Nvim-cmp like layout
									{ "label", "label_description", gap = 1 },
									{ "kind_icon", "kind", gap = 1 },
								},
							},
						},
					},

					sources = {
						default = { "lazydev", "lsp", "path", "snippets" },
						cmdline = {},
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

			{ "hrsh7th/cmp-buffer" }, -- source for text in buffer
			{ "hrsh7th/cmp-path" }, -- source for file system paths
			--  { "hrsh7th/cmp-cmdline" },   -- command line suggestions
			{ "petertriho/cmp-git" }, -- git
			{ "delphinus/cmp-ctags" }, -- ctags source
			-- snippets
			{ "L3MON4D3/LuaSnip" }, -- snippet engine
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
			lspconfig["rust_analyzer"].setup({ capabilities = capabilities })
		end,
	},
}
