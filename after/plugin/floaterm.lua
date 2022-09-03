vim.cmd([[FloatermNew --height=0.4 --wintype=split --name=integrated --silent]])

local function keymap(mode, keys, func, desc)
  vim.keymap.set(mode, keys, func, { noremap = true, silent = true, desc = desc })
end

keymap('n', '<leader>gl', '<cmd>FloatermNew --height=0.8 --width=0.8 lazygit<CR>', '[G]it: Open [L]azygit')
keymap('n', '<F12>', '<cmd>FloatermToggle integrated<CR>', '[T]erminal: [T]oggle')
keymap('t', '<F12>', '<cmd>FloatermToggle integrated<CR>', '[T]erminal: [T]oggle')

