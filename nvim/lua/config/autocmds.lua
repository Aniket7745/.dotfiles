local file = vim.fn.expand("~/.config/nvim/lua/generated/colors.lua")

local timer = vim.loop.new_timer()

vim.api.nvim_create_autocmd("FocusGained", {
  callback = function()
    timer:start(
      50,
      0,
      vim.schedule_wrap(function()
        if vim.fn.filereadable(file) == 1 then
          pcall(vim.cmd, "MatugenReload")
        end
      end)
    )
  end,
})
