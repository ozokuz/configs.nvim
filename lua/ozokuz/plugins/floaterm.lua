vim.schedule(function()
  vim.cmd [[FloatermNew --height=0.4 --wintype=split --name=integrated --silent]]
end)

require('ozokuz.core.keymaps').terminal()
