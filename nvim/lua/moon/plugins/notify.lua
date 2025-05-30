return {
  'rcarriga/nvim-notify',

  config = function()
    local notify = require("notify")
    notify.setup({
      stages = "fade_in_slide_out",
      timeout = 5000,
      background_colour = "#000000",
      top_down = true,
    })
    vim.notify = notify
  end,
}
