return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
  },

  opts = {
    inlay_hints = true
  },

  config = function()
    local cmp = require('cmp')
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_lsp.default_capabilities())
    local lspconfig = require('lspconfig')

    -- Set up all LSP handlers to use notify
    vim.lsp.handlers["window/showMessage"] = function(_, result, ctx)
      local client = vim.lsp.get_client_by_id(ctx.client_id)
      local lvl = ({ "error", "warn", "info", "hint" })[result.type]
      vim.notify(result.message, lvl, {
        title = "LSP | " .. (client and client.name or ""),
        timeout = 5000,
      })
    end

    -- Progress handler
    vim.lsp.handlers["$/progress"] = function(_, result, ctx)
      local client = vim.lsp.get_client_by_id(ctx.client_id)
      local val = result.value

      if not val.kind then
        return
      end

      local message = val.message or ""
      local percentage = val.percentage or 0
      local title = val.title or ""

      local msg = string.format("%s%s", title, message)

      if val.kind == "begin" then
        vim.notify(msg, "info", {
          title = "LSP | " .. (client and client.name or ""),
          timeout = 1000,
        })
      elseif val.kind == "report" and percentage then
        vim.notify(msg, "info", {
          title = string.format("LSP | %s (%d%%)", (client and client.name or ""), percentage),
          replace = true,
        })
      elseif val.kind == "end" then
        vim.notify(msg, "info", {
          title = "LSP | " .. (client and client.name or ""),
          timeout = 1000,
        })
      end
    end

    lspconfig.sourcekit.setup {}
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "golangci_lint_ls",
        "rubocop",
        "vtsls",
        "gopls"
      },
      handlers = {
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup {}
        end,

        ["lua_ls"] = function()
          lspconfig.lua_ls.setup {
            capabilities = capabilities,
            settings = {
              Lua = {
                runtime = { version = "Lua 5.1" },
                diagnostics = {
                  globals = { "vim", "it", "describe", "before_each", "after_each" },
                },
              }
            }
          }
        end,
        ["golangci_lint_ls"] = function()
          lspconfig.golangci_lint_ls.setup {
            capabilities = capabilities,
            settings = {
              golangci_lint_ls = {
                build_flags = { "-tags=integration" }, -- optional
              },
            },
            on_attach = function(client, bufnr)
              local function buf_set_keymap(...)
                vim.api.nvim_buf_set_keymap(bufnr, ...)
              end
              local opts = { noremap = true, silent = true }
              buf_set_keymap("n", "<leader>li", "<cmd>lua vim.lsp.buf.format()<cmd>", opts)
            end,
          }
        end,
      }
    })

    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
      }),
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
      }, {
        { name = 'buffer' },
      })
    })

    vim.diagnostic.config({
      -- update_in_insert = true,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })
  end
}
