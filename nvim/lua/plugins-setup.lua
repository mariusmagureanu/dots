-- auto install packer if not installed
local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
		vim.cmd([[packadd packer.nvim]])
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
	return
end
-- add list of plugins to install
return packer.startup(function(use)
	-- packer can manage itself
	use("wbthomason/packer.nvim")

	-- let's see what options we have when hitting the leader
	--	use("folke/which-key.nvim")
	use("echasnovski/mini.icons")

	use("tpope/vim-fugitive")

	use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

	use("bluz71/vim-nightfly-guicolors") -- preferred colorscheme
	use({ "bluz71/vim-moonfly-colors", branch = "cterm-compat" })
	use("craftzdog/solarized-osaka.nvim")

	use("christoomey/vim-tmux-navigator") -- tmux & split window navigation

	use("szw/vim-maximizer") -- maximizes and restores current window
	use("morhetz/gruvbox") -- gruvbox theme
	use("ayu-theme/ayu-vim") -- ayu theme
	use("decaycs/decay.nvim") -- decay theme
	use("xStormyy/bearded-theme.nvim")
	use("projekt0n/github-nvim-theme")
	use("mhartington/oceanic-next")
	use("chriskempson/base16-vim")
	-- essential plugins
	use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
	use("vim-scripts/ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})
	-- commenting with gc
	use("numToStr/Comment.nvim")

	-- file explorer
	use("nvim-tree/nvim-tree.lua")

	-- vs-code like icons
	use("kyazdani42/nvim-web-devicons")
	use("ryanoasis/vim-devicons")

	-- statusline
	use("nvim-lualine/lualine.nvim")

	-- fuzzy finding w/ telescope
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" }) -- dependency for better sorting performance
	use({ "nvim-telescope/telescope.nvim" }) -- fuzzy finder

	-- autocompletion
	use("hrsh7th/nvim-cmp") -- completion plugin
	use("hrsh7th/cmp-nvim-lsp") -- completion plugin
	use("hrsh7th/cmp-buffer") -- source for text in buffer
	use("hrsh7th/cmp-path") -- source for file system paths
	use("hrsh7th/cmp-cmdline") -- command line suggestions
	use("petertriho/cmp-git") -- git
	use("delphinus/cmp-ctags") -- ctags source
	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets") -- useful snippets

	-- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim") -- in charge of managing lsp servers, linters & formatters
	use("williamboman/mason-lspconfig.nvim") -- bridges gap b/w mason & lspconfig

	-- configuring lsp servers
	use("neovim/nvim-lspconfig") -- easily configure language servers
	use({
		"nvimdev/lspsaga.nvim",
		branch = "main",
		config = function()
			require("lspsaga").setup({})
		end,
	})
	use("onsails/lspkind.nvim") -- vs-code like icons for autocompletion

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- configure formatters & linters
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	-- auto closing
	use("windwp/nvim-autopairs") -- autoclose parens, brackets, quotes, etc...
	use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" }) -- autoclose tags

	-- git integration
	use("lewis6991/gitsigns.nvim") -- show line modifications on left hand side

	use("juliosueiras/vim-terraform-completion") -- terraform
	use("hashivim/vim-terraform")

	use("preservim/tagbar")

	use("fladson/vim-kitty")

	use("fatih/vim-go")

	use("sebdah/vim-delve")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
