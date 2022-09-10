local tmux = require 'nvim-tmux-navigation'

tmux.setup {
  disable_when_zoomed = true,
}

require('core.keymaps').tmux()
