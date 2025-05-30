vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", ":Telescope file_browser<CR>")
vim.keymap.set("n", "<leader>h", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end)
vim.api.nvim_set_keymap('n', '<leader>y', '"+y', { noremap = true, silent = true })

vim.keymap.set("i", "<C-c>", "<Esc>")
vim.api.nvim_set_keymap('n', '<C-k>', ':wincmd k<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', ':wincmd j<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-h>', ':wincmd h<CR>', { silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', ':wincmd l<CR>', { silent = true })
