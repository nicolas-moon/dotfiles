return {
    'stevearc/conform.nvim',
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        local conform = require("conform")
        conform.setup({
            formatters_by_ft = {
                go = { "goimports" },
                rust = { "rustfmt" },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            }
        })

        vim.api.nvim_set_keymap('n', '<leader>f', ':lua require("conform").format()<CR>',
            { noremap = true, silent = true })
    end

}
