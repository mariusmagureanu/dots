local opt = vim.opt -- for conciseness

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- Decrease update time
opt.updatetime = 250
opt.timeoutlen = 300

-- Set completeopt to have a better completion experience
opt.completeopt = "menuone,noselect"

-- NOTE: You should make sure your terminal supports this
opt.termguicolors = true

-- line numbers
-- opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = false -- disable line wrapping

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- appearance

-- turn on termguicolors for nightfly colorscheme to work
-- (have to use iterm2 or any other true color terminal)
-- opt.termguicolors = true
opt.background = "dark" -- colorschemes that can be light or dark will be made dark
opt.signcolumn = "yes" -- show sign column so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

opt.iskeyword:append("-") -- consider string-string as whole word

require("mini.icons").setup()

-- require("which-key").register({
-- 	["<leader>c"] = { name = "[C]ode", _ = "which_key_ignore" },
-- 	["<leader>d"] = { name = "[D]ocument", _ = "which_key_ignore" },
-- 	["<leader>g"] = { name = "[G]it", _ = "which_key_ignore" },
-- 	["<leader>h"] = { name = "More git", _ = "which_key_ignore" },
-- 	["<leader>r"] = { name = "[R]ename", _ = "which_key_ignore" },
-- 	["<leader>s"] = { name = "[S]earch", _ = "which_key_ignore" },
-- 	["<leader>w"] = { name = "[W]orkspace", _ = "which_key_ignore" },
-- })
