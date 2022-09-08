require('nvim-tree').setup {
  renderer = {
    highlight_git = true,
  },
  filters = {
    custom = { '^.git$' },
  },
  view = {
    mappings = {
      list = {
        { key = 'h', action = 'close_node' },
        { key = 'l', action = 'edit' },
        { key = '+', action = 'cd' },
      },
    },
  },
}

vim.keymap.set(
  'n',
  '<leader>ff',
  '<cmd>NvimTreeToggle<CR>',
  { noremap = true, silent = true, desc = '[F]iles: Open [F]ile Explorer' }
)
