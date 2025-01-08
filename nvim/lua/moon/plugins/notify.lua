return {
  'rcarriga/nvim-notify',

  config = function()
    local notify = require("notify")
    notify.setup({
      stages = "fade",
      timeout = 5000,
      background_colour = "#000000",
    })
    vim.notify = notify
  end,
}
