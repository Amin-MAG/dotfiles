vim.g.mapleader = "\\"

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
vim.keymap.set("n", "<leader>t", "<C-w>s:terminal<CR>A")
vim.keymap.set("n", "<leader>[", ":bp<CR>")
vim.keymap.set("n", "<leader>]", ":bn<CR>")
vim.api.nvim_set_keymap('n', '<leader>\\', 'gg=G``', {noremap = true})
vim.api.nvim_set_keymap('t', '\\t', '<C-\\><C-n>', {noremap = true})
