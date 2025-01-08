return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavor = "mocha",
      transparent_background = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        treesitter = true,
        notify = true,
        mason = true,
        fidget = true,
        harpoon = true,
        copilot_vim = true,
        telescope = true,
        which_key = true,
      },
      custom_highlights = {
        LspFloatWinBorder = { fg = "#FAB387" },
        LspFloatWinNormal = { bg = "NONE" },
      },
    })
    vim.cmd.colorscheme "catppuccin"

    -- Additional LSP hover settings
    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
      vim.lsp.handlers.hover, {
        border = "rounded", -- Options: "single", "double", "rounded", "solid"
      }
    )
  end
}
