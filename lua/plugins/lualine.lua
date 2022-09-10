local U = require 'core.utils'

require('lualine').setup {
  options = {
    globalstatus = true,
  },
  winbar = U.is_nvim_080() and {
    lualine_a = { 'filename' },
    lualine_b = { 'aerial' },
  } or nil,
  inactive_winbar = U.is_nvim_080() and {
    lualine_a = { 'filename' },
  } or nil,
  extensions = { 'nvim-tree' },
}
