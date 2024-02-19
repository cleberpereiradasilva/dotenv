vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>nh", ":nohl<CR>")

keymap.set("n", "x", '"_x') -- in NORMAL mode use x to delete single character but dont keep it in clipboard

keymap.set("n", "<C-s>", ":w<CR>") -- in NORMAL mode save
keymap.set("n", "zz", ":wq<CR>") -- in NORMAL mode save and exit

keymap.set("v", "<Tab>", ">") -- in VISUAL mode use Tab to indent lines

-- Split Window, Close Window:

keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

-- Tabs:

keymap.set("n", "<leader>to", ":tabnew<CR>") -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>") -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>") -- go to next tab
keymap.set("n", "<leader><Tab>", ":bn<CR>") -- go to next tab
keymap.set("n", "<leader><S-Tab>", ":bp<CR>") -- go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>") -- go to previous tab

-- plugin keymaps:

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>")

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>")
keymap.set("n", "<leader>se", ":NvimTreeFocus<CR>")

-- telescope
keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>") -- find files within current working directory, respects .gitignore
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>") -- find string in current working directory as you type
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>") -- find string under cursor in current working directory
keymap.set("n", "<leader>b", "<cmd>Telescope buffers<cr>") -- list open buffers in current neovim instance
keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>") -- list available help tags

-- lazygit
vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
keymap.set("n", "<leader>lg", "<cmd>LazyGit<cr>") -- toggle LazyGit

vim.keymap.set("n", "gD", function()
	local org_path = vim.api.nvim_buf_get_name(0)

	-- Go to definition:
	vim.api.nvim_command("normal gd")

	-- Wait LSP server response
	vim.wait(100, function() end)

	local new_path = vim.api.nvim_buf_get_name(0)
	if not (org_path == new_path) then
		-- Create a new tab for the original file
		vim.api.nvim_command("0tabnew %")

		-- Restore the cursor position
		vim.api.nvim_command("b " .. org_path)
		vim.api.nvim_command('normal! `"')

		-- Switch to the original tab
		vim.api.nvim_command("normal! gt")
	end
end, bufopts)
