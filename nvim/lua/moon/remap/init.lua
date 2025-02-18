vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", ":Telescope file_browser<CR>")
vim.keymap.set("n", "<leader>h", function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled()) end)
vim.api.nvim_set_keymap('n', '<leader>y', '"+y', { noremap = true, silent = true })

vim.keymap.set("i", "<C-c>", "<Esc>")
