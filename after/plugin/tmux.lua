local k = vim.keymap
local tmux = require 'nvim-tmux-navigation'

tmux.setup {
  disable_when_zoomed = true,
}

k.set('n', '<C-h>', tmux.NvimTmuxNavigateLeft)
k.set('n', '<C-j>', tmux.NvimTmuxNavigateDown)
k.set('n', '<C-k>', tmux.NvimTmuxNavigateUp)
k.set('n', '<C-l>', tmux.NvimTmuxNavigateRight)
k.set('n', '<C-\\>', tmux.NvimTmuxNavigateLastActive)
