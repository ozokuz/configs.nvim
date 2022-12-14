require('gitsigns').setup {
  signs = {
    add = { text = '+' },
    change = { text = '~' },
    delete = { text = '_' },
    topdelete = { text = '‾' },
    changedelete = { text = '~' },
  },
}

require('neogit').setup { integrations = { diffview = true } }

local Terminal = require('toggleterm.terminal').Terminal
local lazygit =
  Terminal:new { cmd = 'lazygit', hidden = true, direction = 'float' }

require('core.keymaps').git(lazygit)
