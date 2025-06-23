local opt = vim.opt

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- Decrease update time
opt.updatetime = 250
opt.timeoutlen = 300

opt.completeopt = "menuone,noselect"

opt.termguicolors = true

opt.number = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

opt.cursorline = true

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

opt.clipboard:append("unnamedplus") -- use system clipboard as default register

opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

vim.diagnostic.config({
	virtual_text = true, -- shows errors inline
	underline = true, -- underlines problem code
	update_in_insert = false,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = "☭ ",
			[vim.diagnostic.severity.INFO] = " ",
		},
	},
})

vim.lsp.set_log_level("error")
vim.g.loaded = 1
