local keymap = vim.keymap
-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>")  -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>")   -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>")     -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>")   -- list available help tags

-- telescope git commands
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>")   -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>") -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>")  -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>")    -- list current changes per file with diff preview ["gs" for git status]

-- nvim-tree
keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")

-- Lspsaga
keymap.set("n", "gh", "<cmd>Lspsaga finder<CR>")
keymap.set({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")

keymap.set("n", "gr", "<cmd>Lspsaga rename<CR>")
keymap.set("n", "gR", "<cmd>Lspsaga rename ++project<CR>")

keymap.set("n", "gD", "<cmd>Lspsaga peek_definition<CR>")
keymap.set("n", "gd", "<cmd>Lspsaga goto_definition<CR>")

keymap.set("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
keymap.set("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")
keymap.set("n", "<Leader>o", "<cmd>Lspsaga outline<CR>")

-- Tagbar
keymap.set("n", "<Leader>tb", "<cmd>TagbarToggle<CR>")
