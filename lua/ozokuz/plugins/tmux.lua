local tmux = require 'nvim-tmux-navigation'

tmux.setup {
  disable_when_zoomed = true,
}

require('ozokuz.core.keymaps').tmux()
