local k = vim.keymap

-- Set leader key
vim.g.mapleader = ' '

-- No x yank
k.set('n', 'x', '"_x')

-- Stay in visual when indenting
k.set('v', '<', '<gv')
k.set('v', '>', '>gv')

-- Increment & Decrement
k.set('n', '+', '<C-a>')
k.set('n', '-', '<C-x>')

-- Select all
k.set('n', '<C-a>', 'gg<S-v>G')

-- New tab
k.set('n', '<leader>te', ':tabedit<Return>')

-- Split Window
k.set('n', '<leader>ws', ':split<Return><C-w>w')
k.set('n', '<leader>wv', ':vsplit<Return><C-w>w')

