-- import lspsaga safely
local saga_status, _ = pcall(require, "lspsaga")
if not saga_status then
	print("could not import lspsaga")
	return
end

local keymap = vim.keymap.set
-- Lsp finder find the symbol definition implement reference
-- if there is no implement it will hide
-- when you use action in finder like open vsplit then you can
-- use <C-t> to jump back
keymap("n", "gh", "<cmd>Lspsaga finder<CR>")

-- Code action
keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")

-- Rename
keymap("n", "gr", "<cmd>Lspsaga rename<CR>")

-- Rename word in whole project
keymap("n", "gr", "<cmd>Lspsaga rename ++project<CR>")

-- Peek Definition
-- you can edit the definition file in this float window
-- also support open/vsplit/etc operation check definition_action_keys
-- support tagstack C-t jump back
keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>")

-- Go to Definition
keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>")

-- Callhierarchy
keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")

-- Float terminal
keymap({ "n", "t" }, "<Leader>kt", "<cmd>Lspsaga term_toggle<CR>")

-- saga.init_lsp_saga({
-- 	-- keybinds for navigation in lspsaga window
-- 	move_in_saga = { prev = "<C-k>", next = "<C-j>" },
-- 	-- use enter to open file with finder
-- 	finder_action_keys = {
-- 		open = "<CR>",
-- 	},
-- 	-- use enter to open file with definition preview
-- 	definition_action_keys = {
-- 		edit = "<CR>",
-- 	},
-- })
