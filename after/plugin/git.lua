require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

vim.keymap.set(
  'n',
  '<leader>gl',
  '<cmd>FloatermNew --height=0.8 --width=0.8 lazygit<CR>',
  { desc = '[G]it: Open [L]azygit' }
)
