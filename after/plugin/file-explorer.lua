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
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
}

vim.keymap.set(
  'n',
  '<leader>ff',
  '<cmd>NvimTreeToggle<CR>',
  { noremap = true, silent = true, desc = '[F]iles: Open [F]ile Explorer' }
)
