local k = vim.keymap

-- Set leader key
vim.g.mapleader = ' '

-- No x yank
k.set('n', 'x', '"_x', {})

-- Stay in visual when indenting
k.set('v', '<', '<gv', {})
k.set('v', '>', '>gv', {})

-- Increment & Decrement
k.set('n', '+', '<C-a>', {})
k.set('n', '-', '<C-x>', {})

-- Select all
k.set('n', '<C-a>', 'gg<S-v>G', {})

local function keymap(keys, func, desc)
  vim.keymap.set('n', keys, func, { noremap = true, silent = true, desc = desc })
end

-- New tab
keymap('<leader>te', '<cmd>tabedit<CR>', '[T]ab: [E]dit')

-- Split Window
keymap('<leader>ws', '<cmd>split<CR><C-w>w', '[W]indow: [S]plit Horizontal')
keymap('<leader>wv', '<cmd>vsplit<CR><C-w>w', '[W]indow: Split [V]ertical')
keymap('<leader>ww', '<cmd>w<CR>', '[W]indow: Save')
keymap('<leader>wq', '<cmd>wq<CR>', '[W]indow: Save & Close')
keymap('<leader>wd', '<cmd>q!<CR>', '[W]indow: Destroy')

-- Quit
keymap('<leader>qq', '<cmd>qa!<CR>', '[Q]uit: All Without Saving')
keymap('<leader>qw', '<cmd>wall<CR><cmd>qall<CR>', '[Q]uit: Save All')

