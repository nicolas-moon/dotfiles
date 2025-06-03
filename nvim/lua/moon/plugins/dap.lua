vim.api.nvim_create_augroup("DapGroup", { clear = true })

local function navigate(args)
  local buffer = args.buf

  local wid = nil
  local win_ids = vim.api.nvim_list_wins() -- get all window ids
  for _, win_id in ipairs(win_ids) do
  local win_bufnr = 
